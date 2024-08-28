<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/EconnectNew.master" CodeFile="TemplateMaster.aspx.cs" Inherits="ERM_TemplateMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../Calendar/dist/adminlte.min.css">
    <!-- Flatpicker Datepicker JS/CSS file-->
    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <style>
        .slider-content-wrapper {
            display: flex;
            margin: -20px;
            /*height: 300px;*/
            transition: transform 0.5s ease-in-out;
        }

        /*Слайд*/
        .slider-content__item {
            padding: 30px 100px;
            flex: 1 0 100%;
            width: 100%;
            height: 100%;
            background-repeat: no-repeat;
            background-position: center;
            background-size: contain;
            /*font-size: 100px;*/
            /*color: rgba(0,0,0,0.2);*/
            display: flex;
            flex-direction: column;
            align-items: center;
            align-items: center;
            justify-content: center;
        }

        /* Блок с контролами */
        .slider-controls {
            padding: 20px;
            text-align: center;
        }

        /* Блок с контролами внутри окна */
        .slider-content__controls {
            /*position: absolute;*/
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1;
            /*transform: translateY(-50%);*/
            /*padding:0 15px;*/
        }

        /* Arrows */
        .prev-arrow, .next-arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: rgba(0,0,0, 0.3);
            width: 20px;
            transition: all 0.3s;
        }

        .prev-arrow {
            left: 20px;
        }

        .next-arrow {
            right: 20px;
        }

            .prev-arrow:hover,
            .next-arrow:hover {
                cursor: pointer;
                color: rgba(0,0,0, 0.7);
            }

        /* Dots */
        .dots {
            position: absolute;
            display: flex;
            left: 50%;
            transform: translateX(-50%);
            bottom: 10%;
        }

        .dot {
            cursor: pointer;
            width: 8px;
            height: 8px;
            margin-right: 4px;
            background-color: rgba(0,0,0, 0.3);
            /*box-shadow: 0 0 5px 0px rgba(0,0,0,0.9);*/
            border-radius: 50%;
            transition: all 0.3s;
        }

            .dot:last-child {
                margin-right: 0;
            }

            .dot:hover {
                background-color: #fff;
            }

        .dot--active {
            background-color: rgba(255,255,255, 0.5);
        }

        /* Buttons */
        button {
            cursor: pointer;
            margin-right: 8px;
            border: none;
            border-radius: 4px;
            padding: 10px;
            background-color: #3066BE;
            color: #FFF;
            transition: all 0.5s;
        }

            button:last-child {
                margin-right: 0;
            }

            button:hover {
                background-color: #60AFFF;
            }

            button:focus {
                outline: none;
            }

        /* Mods */
        .disabled {
            background-color: #DCCFCF;
            color: #B0A8A8;
            cursor: default;
            pointer-events: none;
        }

        .d-none {
            display: none;
        }

        .active {
            opacity: 1;
        }

        .centered {
            position: relative;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
        }

        #start svg {
            width: calc(68px * 3);
            height: calc(66px * 3);
        }

        /* ELEMENTS POSITIONS */
        #building_bottom,
        #window_01,
        #window_02,
        #door {
            transform: translateY(20px);
            z-index: 1;
        }

        #building_top,
        #balcony_01,
        #balcony_02,
        #balcony_03,
        #balcony_04,
        #balcony_05,
        #balcony_06 {
            transform: translateY(56px);
            z-index: -1;
        }

        #small_tree,
        #big_tree {
            transform: translateY(28px);
        }

        /* ELEMENTS ANIMATIONS */
        #building_bottom {
            animation: buildingBottom 1s ease-out forwards;
        }

        #window_01,
        #window_02,
        #door {
            animation: buildingBottom 1s 0.1s ease-in forwards;
        }

        #building_top {
            animation: buildingTop 1s 1.2s ease-out forwards;
        }

        #balcony_01,
        #balcony_02,
        #balcony_03 {
            animation: buildingTop 1s 1.4s ease-out forwards;
        }

        #balcony_04,
        #balcony_05,
        #balcony_06 {
            animation: buildingTop 1s 1.6s ease-out forwards;
        }

        #small_tree,
        #big_tree {
            animation: trees 1s 2s ease-out forwards;
        }

        #cloud_left {
            transform: translateX(-11px);
            animation: cloudLeft 20s 2s linear infinite;
        }

        #cloud_right {
            transform: translateX(72px);
            animation: cloudRight 15s 2s linear infinite;
        }

        /* ANIMATIONS */
        @keyframes buildingBottom {
            0% {
                transform: translateY(20px)
            }

            100% {
                transform: translateY(0)
            }
        }

        @keyframes buildingTop {
            0% {
                transform: translateY(56px);
            }

            100% {
                transform: translateY(0);
            }
        }

        @keyframes trees {
            0% {
                transform: translateY(28px);
            }

            100% {
                transform: translateY(0);
            }
        }

        @keyframes cloudLeft {
            0% {
                transform: translateX(-11px);
            }

            100% {
                transform: translateX(100px);
            }
        }

        @keyframes cloudRight {
            0% {
                transform: translateX(72px);
            }

            100% {
                transform: translateX(-100px);
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <div class="card-body">
            <div>
                <h3 class="mb-3" style="">Template Master</h3>
                <p>Create a template of sturcture and items. Use this template in any estimation, simply by importing.</p>
            </div>

            <div class="card-body" style="margin-top: -1%;">
                <nav class="nav-tab border-bottom">
                    <ul class="nav nav-pills" id="pills-tab-salesgrwoth" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active show" id="pill-temp-deet-tab" data-bs-toggle="pill" data-bs-target="#temp-deet-tab" type="button" role="tab" aria-controls="temp-deet-tab" aria-selected="true">Template Details</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="pill-temp-create-tab" data-bs-toggle="pill" data-bs-target="#temp-create-tab" type="button" role="tab" aria-controls="temp-create-tab" aria-selected="false">Create Template</button>
                        </li>
                    </ul>
                </nav>
                <div class="tab-content mt-3" id="pills-sgcontent">
                    <div class="tab-pane fade show active" id="temp-deet-tab" role="tabpanel" aria-labelledby="pill-temp-deet-tab">

                        <div class="mt-3 table">
                            <table class="table template-list-table">
                                <thead>
                                    <tr class="">
                                        <th style="display: none">ID</th>
                                        <th style="display: none">Role ID</th>
                                        <th>Template Name</th>
                                        <th>Total Floors</th>
                                        <th>Total Items</th>
                                        <th>Type</th>
                                        <th>Description</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody class="template-tbody"></tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="temp-create-tab" role="tabpanel" aria-labelledby="pill-temp-create-tab">

                        <div id="slider" class="slider">
                            <div class="d-flex shadow rounded p-3" style="width: 14%;">
                                <div class="me-2">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="3rem" height="3rem" viewBox="0 0 24 24">
                                        <path fill="none" stroke="#a92828" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 9h14M5 15h14M11 4L7 20M17 4l-4 16" />
                                    </svg>
                                </div>
                                <div>
                                    <label for="html5-number-input" class="  label-custom">Template REF No.</label>
                                    <div class="">
                                        <label id="RefNo" value="" class="">--</label>
                                    </div>
                                </div>
                            </div>
                            <div class="slider-content">
                                <div class="slider-content-wrapper">
                                    <div class="slider-content__item text-center">
                                        <h4 class="mt-3">Welcome to, Template Creation</h4>
                                        <div id="start">
                                            <svg width="68" height="66" viewBox="0 0 68 66" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <g id="art">
                                                    <mask id="mask0" mask-type="alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="68" height="66">
                                                        <rect id="mask" width="68" height="66" fill="#C4C4C4" />
                                                    </mask>
                                                    <g mask="url(#mask0)">
                                                        <g id="composition">
                                                            <rect id="background" x="2" y="2" width="64" height="64" fill="#A8DADC" />
                                                            <g id="cloud_left">
                                                                <path id="cloud_left_2" d="M8 30C8 30.0422 7.99951 30.0844 7.99866 30.1264C8.31873 30.0439 8.65417 30 9 30C11.2091 30 13 31.7909 13 34C13 36.2091 11.2091 38 9 38H-4.5C-6.98523 38 -9 35.9853 -9 33.5C-9 31.0147 -6.98523 29 -4.5 29C-4.30457 29 -4.11194 29.0125 -3.9231 29.0367C-3.46216 26.1809 -0.98584 24 2 24C5.31372 24 8 26.6863 8 30Z" fill="#F1FAEE" />
                                                            </g>
                                                            <g id="cloud_right">
                                                                <path id="cloud_right_2" d="M77 10C77 10.0422 76.9995 10.0844 76.9987 10.1264C77.3187 10.0439 77.6542 10 78 10C80.2091 10 82 11.7909 82 14C82 16.2091 80.2091 18 78 18H64.5C62.0148 18 60 15.9853 60 13.5C60 11.0147 62.0148 9 64.5 9C64.6954 9 64.8881 9.01248 65.0769 9.03665C65.5378 6.18091 68.0142 4 71 4C74.3137 4 77 6.68628 77 10Z" fill="#F1FAEE" />
                                                            </g>
                                                            <g id="building_top">
                                                                <path id="Rectangle 425" d="M16 17H52V47H16V17Z" fill="#F1FAEE" />
                                                                <path id="Rectangle 425 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M15 17C15 16.4477 15.4477 16 16 16H52C52.5523 16 53 16.4477 53 17V47C53 47.5523 52.5523 48 52 48H16C15.4477 48 15 47.5523 15 47V17ZM17 18V46H51V18H17Z" fill="#1D3557" />
                                                                <path id="Rectangle 426" d="M14 13H54V17H14V13Z" fill="#457B9D" />
                                                                <path id="Rectangle 426 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M13 13C13 12.4477 13.4477 12 14 12H54C54.5523 12 55 12.4477 55 13V17C55 17.5523 54.5523 18 54 18H14C13.4477 18 13 17.5523 13 17V13ZM15 14V16H53V14H15Z" fill="#1D3557" />
                                                            </g>
                                                            <g id="balcony_01">
                                                                <path id="Rectangle 427" d="M20 21H26V27H20V21Z" fill="#F1FAEE" />
                                                                <path id="Rectangle 427 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M19 21C19 20.4477 19.4477 20 20 20H26C26.5523 20 27 20.4477 27 21V27C27 27.5523 26.5523 28 26 28H20C19.4477 28 19 27.5523 19 27V21ZM21 22V26H25V22H21Z" fill="#1D3557" />
                                                                <path id="Rectangle 428" d="M19 27H27V30H19V27Z" fill="#457B9D" />
                                                                <path id="Rectangle 428 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M18 27C18 26.4477 18.4477 26 19 26H27C27.5523 26 28 26.4477 28 27V30C28 30.5523 27.5523 31 27 31H19C18.4477 31 18 30.5523 18 30V27ZM20 28V29H26V28H20Z" fill="#1D3557" />
                                                            </g>
                                                            <g id="balcony_04">
                                                                <path id="Rectangle 433" d="M20 34H26V40H20V34Z" fill="#F1FAEE" />
                                                                <path id="Rectangle 433 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M19 34C19 33.4477 19.4477 33 20 33H26C26.5523 33 27 33.4477 27 34V40C27 40.5523 26.5523 41 26 41H20C19.4477 41 19 40.5523 19 40V34ZM21 35V39H25V35H21Z" fill="#1D3557" />
                                                                <path id="Rectangle 436" d="M19 40H27V43H19V40Z" fill="#457B9D" />
                                                                <path id="Rectangle 436 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M18 40C18 39.4477 18.4477 39 19 39H27C27.5523 39 28 39.4477 28 40V43C28 43.5523 27.5523 44 27 44H19C18.4477 44 18 43.5523 18 43V40ZM20 41V42H26V41H20Z" fill="#1D3557" />
                                                            </g>
                                                            <g id="balcony_02">
                                                                <path id="Rectangle 429" d="M31 21H37V27H31V21Z" fill="#F1FAEE" />
                                                                <path id="Rectangle 429 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M30 21C30 20.4477 30.4477 20 31 20H37C37.5523 20 38 20.4477 38 21V27C38 27.5523 37.5523 28 37 28H31C30.4477 28 30 27.5523 30 27V21ZM32 22V26H36V22H32Z" fill="#1D3557" />
                                                                <path id="Rectangle 430" d="M30 27H38V30H30V27Z" fill="#457B9D" />
                                                                <path id="Rectangle 430 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M29 27C29 26.4477 29.4477 26 30 26H38C38.5523 26 39 26.4477 39 27V30C39 30.5523 38.5523 31 38 31H30C29.4477 31 29 30.5523 29 30V27ZM31 28V29H37V28H31Z" fill="#1D3557" />
                                                            </g>
                                                            <g id="balcony_05">
                                                                <path id="Rectangle 440" d="M31 34H37V40H31V34Z" fill="#F1FAEE" />
                                                                <path id="Rectangle 440 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M30 34C30 33.4477 30.4477 33 31 33H37C37.5523 33 38 33.4477 38 34V40C38 40.5523 37.5523 41 37 41H31C30.4477 41 30 40.5523 30 40V34ZM32 35V39H36V35H32Z" fill="#1D3557" />
                                                                <path id="Rectangle 437" d="M30 40H38V43H30V40Z" fill="#457B9D" />
                                                                <path id="Rectangle 437 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M29 40C29 39.4477 29.4477 39 30 39H38C38.5523 39 39 39.4477 39 40V43C39 43.5523 38.5523 44 38 44H30C29.4477 44 29 43.5523 29 43V40ZM31 41V42H37V41H31Z" fill="#1D3557" />
                                                            </g>
                                                            <g id="balcony_03">
                                                                <path id="Rectangle 431" d="M42 21H48V27H42V21Z" fill="#F1FAEE" />
                                                                <path id="Rectangle 431 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M41 21C41 20.4477 41.4477 20 42 20H48C48.5523 20 49 20.4477 49 21V27C49 27.5523 48.5523 28 48 28H42C41.4477 28 41 27.5523 41 27V21ZM43 22V26H47V22H43Z" fill="#1D3557" />
                                                                <path id="Rectangle 432" d="M41 27H49V30H41V27Z" fill="#457B9D" />
                                                                <path id="Rectangle 432 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M40 27C40 26.4477 40.4477 26 41 26H49C49.5523 26 50 26.4477 50 27V30C50 30.5523 49.5523 31 49 31H41C40.4477 31 40 30.5523 40 30V27ZM42 28V29H48V28H42Z" fill="#1D3557" />
                                                            </g>
                                                            <g id="balcony_06">
                                                                <path id="Rectangle 435" d="M42 34H48V40H42V34Z" fill="#F1FAEE" />
                                                                <path id="Rectangle 435 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M41 34C41 33.4477 41.4477 33 42 33H48C48.5523 33 49 33.4477 49 34V40C49 40.5523 48.5523 41 48 41H42C41.4477 41 41 40.5523 41 40V34ZM43 35V39H47V35H43Z" fill="#1D3557" />
                                                                <path id="Rectangle 438" d="M41 40H49V43H41V40Z" fill="#457B9D" />
                                                                <path id="Rectangle 438 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M40 40C40 39.4477 40.4477 39 41 39H49C49.5523 39 50 39.4477 50 40V43C50 43.5523 49.5523 44 49 44H41C40.4477 44 40 43.5523 40 43V40ZM42 41V42H48V41H42Z" fill="#1D3557" />
                                                            </g>
                                                            <g id="big_tree">
                                                                <path id="Rectangle 443" d="M56 42C56 39.7909 57.7909 38 60 38C62.2091 38 64 39.7909 64 42V54C64 56.2091 62.2091 58 60 58C57.7909 58 56 56.2091 56 54V42Z" fill="#457B9D" />
                                                                <path id="Rectangle 443 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M55 42C55 39.2386 57.2386 37 60 37C62.7614 37 65 39.2386 65 42V54C65 56.7614 62.7614 59 60 59C57.2386 59 55 56.7614 55 54V42ZM60 39C58.3431 39 57 40.3431 57 42V54C57 55.6569 58.3431 57 60 57C61.6569 57 63 55.6569 63 54V42C63 40.3431 61.6569 39 60 39Z" fill="#1D3557" />
                                                                <path id="Line 95 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M60 48C60.5523 48 61 48.4477 61 49L61 64C61 64.5523 60.5523 65 60 65C59.4477 65 59 64.5523 59 64L59 49C59 48.4477 59.4477 48 60 48Z" fill="#1D3557" />
                                                            </g>
                                                            <g id="small_tree">
                                                                <path id="Rectangle 444" d="M4 48C4 45.7909 5.79086 44 8 44V44C10.2091 44 12 45.7909 12 48V54C12 56.2091 10.2091 58 8 58V58C5.79086 58 4 56.2091 4 54V48Z" fill="#457B9D" />
                                                                <path id="Rectangle 444 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M3 48C3 45.2386 5.23858 43 8 43C10.7614 43 13 45.2386 13 48V54C13 56.7614 10.7614 59 8 59C5.23858 59 3 56.7614 3 54V48ZM8 45C6.34315 45 5 46.3431 5 48V54C5 55.6569 6.34315 57 8 57C9.65685 57 11 55.6569 11 54V48C11 46.3431 9.65685 45 8 45Z" fill="#1D3557" />
                                                                <path id="Line 96 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M8 51C8.55228 51 9 51.4477 9 52L9 64C9 64.5523 8.55228 65 8 65C7.44771 65 7 64.5523 7 64L7 52C7 51.4477 7.44772 51 8 51Z" fill="#1D3557" />
                                                            </g>
                                                            <g id="building_bottom">
                                                                <path id="Rectangle 423" d="M15 47H53V51H15V47Z" fill="#457B9D" />
                                                                <path id="Rectangle 423 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M14 47C14 46.4477 14.4477 46 15 46H53C53.5523 46 54 46.4477 54 47V51C54 51.5523 53.5523 52 53 52H15C14.4477 52 14 51.5523 14 51V47ZM16 48V50H52V48H16Z" fill="#1D3557" />
                                                                <path id="Rectangle 424" d="M16 51H52V65H16V51Z" fill="#F1FAEE" />
                                                                <path id="Rectangle 424 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M15 51C15 50.4477 15.4477 50 16 50H52C52.5523 50 53 50.4477 53 51V65C53 65.5523 52.5523 66 52 66H16C15.4477 66 15 65.5523 15 65V51ZM17 52V64H51V52H17Z" fill="#1D3557" />
                                                            </g>
                                                            <g id="window_01">
                                                                <path id="window 01" d="M20 55H24V61H20V55Z" fill="#F1FAEE" />
                                                                <path id="window 01 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M19 55C19 54.4477 19.4477 54 20 54H24C24.5523 54 25 54.4477 25 55V61C25 61.5523 24.5523 62 24 62H20C19.4477 62 19 61.5523 19 61V55ZM21 56V60H23V56H21Z" fill="#1D3557" />
                                                            </g>
                                                            <g id="window_02">
                                                                <path id="window 02" d="M44 55H48V61H44V55Z" fill="#F1FAEE" />
                                                                <path id="window 02 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M43 55C43 54.4477 43.4477 54 44 54H48C48.5523 54 49 54.4477 49 55V61C49 61.5523 48.5523 62 48 62H44C43.4477 62 43 61.5523 43 61V55ZM45 56V60H47V56H45Z" fill="#1D3557" />
                                                            </g>
                                                            <g id="door">
                                                                <path id="Rectangle 434" d="M28 55H34V65H28V55Z" fill="#F1FAEE" />
                                                                <path id="Rectangle 434 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M27 55C27 54.4477 27.4477 54 28 54H34C34.5523 54 35 54.4477 35 55V65C35 65.5523 34.5523 66 34 66H28C27.4477 66 27 65.5523 27 65V55ZM29 56V64H33V56H29Z" fill="#1D3557" />
                                                                <path id="Rectangle 439" d="M34 55H40V65H34V55Z" fill="#F1FAEE" />
                                                                <path id="Rectangle 439 (Stroke)" fill-rule="evenodd" clip-rule="evenodd" d="M33 55C33 54.4477 33.4477 54 34 54H40C40.5523 54 41 54.4477 41 55V65C41 65.5523 40.5523 66 40 66H34C33.4477 66 33 65.5523 33 65V55ZM35 56V64H39V56H35Z" fill="#1D3557" />
                                                            </g>
                                                            <rect id="frame" x="1" y="1" width="66" height="64" stroke="#1D3557" stroke-width="2" stroke-linejoin="round" />
                                                        </g>
                                                    </g>
                                                </g>
                                            </svg>
                                        </div>
                                        <h6 class="mt-5 w-25">Let's Build a Template Together! Creation one time , reuse, save time.</h6>
                                        <div class="col-md-12 mt-3">
                                            <a class="btn btn-primary" id="_startbtn">Get Ref #
                                                <svg xmlns="http://www.w3.org/2000/svg" class="ms-2" width="2rem" height="2rem" viewBox="0 0 24 24">
                                                    <path fill="#ffffff" fill-rule="evenodd" d="M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2S2 6.477 2 12s4.477 10 10 10M9.97 8.47a.75.75 0 0 1 1.06 0l3 3a.75.75 0 0 1 0 1.06l-3 3a.75.75 0 1 1-1.06-1.06L12.44 12L9.97 9.53a.75.75 0 0 1 0-1.06" clip-rule="evenodd" />
                                                </svg>
                                            </a>
                                            <span id="refDone" class="hidden">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" viewBox="0 0 24 24">
                                                    <defs>
                                                        <mask id="lineMdCheckAll0">
                                                            <g fill="none" stroke="#fff" stroke-dasharray="22" stroke-dashoffset="22" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                                                <path d="M2 13.5l4 4l10.75 -10.75">
                                                                    <animate fill="freeze" attributeName="stroke-dashoffset" dur="0.4s" values="22;0" />
                                                                </path>
                                                                <path stroke="#000" stroke-width="4" d="M7.5 13.5l4 4l10.75 -10.75" opacity="0">
                                                                    <set attributeName="opacity" begin="0.4s" to="1" />
                                                                    <animate fill="freeze" attributeName="stroke-dashoffset" begin="0.4s" dur="0.4s" values="22;0" />
                                                                </path>
                                                                <path d="M7.5 13.5l4 4l10.75 -10.75" opacity="0">
                                                                    <set attributeName="opacity" begin="0.4s" to="1" />
                                                                    <animate fill="freeze" attributeName="stroke-dashoffset" begin="0.4s" dur="0.4s" values="22;0" />
                                                                </path>
                                                            </g>
                                                        </mask>
                                                    </defs>
                                                    <rect width="24" height="24" fill="#0aae61" mask="url(#lineMdCheckAll0)" />
                                                </svg>
                                            </span>
                                        </div>

                                    </div>

                                    <div class="slider-content__item">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label>Template Name*</label>
                                                <input class="form-control" type="text" id="TempName" placeholder="enter template name...">
                                            </div>
                                            <div class="col-md-12 mt-3">
                                                <label>Description*</label>
                                                <textarea id="TempDesc" rows="3" class="form-control" style="overflow-y: scroll;" placeholder="enter template description..."></textarea>
                                            </div>
                                            <div class="col-md-12 mt-3">
                                                <a class="btn btn-primary _createTemplate disabled" id="1">Done</a>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="slider-content__item">

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
                                        <button type="button" class="btn btn-primary btnSaveItem disabled">Create</button>
                                        <%--<button type="button" class="btn btn-primary btnSubmit hidden">Publish</button>--%>
                                    </div>

                                    <div class="slider-content__item">
                                        <div class="row mb-3 w-100">
                                            <div class="col-12">
                                                <div class="accordion" id="accordionStructure">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row w-100">

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
                                            <div class="col-md-2 adv-filter ">
                                             <%--   <label>Is Typical</label>
                                                <div style="display: flex; justify-content: center;">
                                                    <input class="form-check-input" type="checkbox" value="Base" id="cbIsTypical">
                                                </div>--%>
                                            </div>

                                            <div class="col-md-3 adv-filter ">
                                                <label>Master Floor</label>
                                                <select id="ddlFloorMaster" class="form-select color-dropdown"></select>
                                            </div>
                                        </div>

                                        <div class="table mt-4 temp-sel-typifloor-table-div" style="overflow-y: auto; max-height: 800px;">
                                            <table class="table project-table temp-sel-typifloor-table" style="width: 100%;">
                                                <thead style="position: sticky; top: -3px;">
                                                    <tr class="Head-tr">
                                                        <th style="width: 52px !important">Select</th>
                                                        <th>Floor Name</th>
                                                        <th>Floor Type</th>
                                                        <th>Master Floor</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="tbody-temp-sel-typifloor"></tbody>
                                            </table>
                                        </div>
                                        <button type="button" class="btn btn-primary btnUpdateTypicalFloors mt-3">Save </button>
                                    </div>
                                    
                                     <div class="slider-content__item">
                                        <button type="button" class="btn btn-primary btn-add-item-toc-grid float-right hide-control-bos">
                                            <svg class="me-3" xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 16 16">
                                                <path fill="#fff" d="M11 11H9v1h2v2h1v-2h2v-1h-2V9h-1zM7.758 9a4.5 4.5 0 1 1-.502 4H6v-1h1.027a4.55 4.55 0 0 1 .23-2H6V9zM2 4V3h2v1zm4 0V3h8v1zm0 3V6h8v1zM2 7V6h2v1zm0 3V9h2v1zm0 3v-1h2v1z" />
                                            </svg>Add Item(s)
                                        </button>
                                        <div class="row system-div-parent">

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="mt-3">
                        </div>
                    </div>
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
                            <input class="form-control" type="number" id="txtQuantityTOC" placeholder="enter quantity" min="0">
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
                    <button type="button" class="btn btn-primary btnAddTechRemarks">Save Notes </button>
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
                            <input class="form-control" type="number" id="txtEngineering" min="0">
                        </div>
                        <div class="col-md-4">
                            <label>Test and Commsioning</label>
                            <input class="form-control" type="number" id="txtTestnCommision" min="0">
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



    <script type="text/javascript">
        var currUserId = '';
        var EmpNo = '';
        var myrole = '';
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
    <script src="Scripts/TemplateMaster.js?v=1"></script>
    <script src="Scripts/common.js?v=1"></script>
    <link href="Css/EMSStyle.css" rel="stylesheet" />

    <!-- Select/Multiselect Dropdown JS/CSS file -->
    <%--  <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>--%>
    <script src="script/multiple-select.js"></script>
    <link href="../SiteSurvey/Assets/Css/multiple-select.css" rel="stylesheet" />

    <script src="Assets/Js/multiple-select.js"></script>
    <link href="../sitesurvey/Assets/Css/multiple-select.css" rel="stylesheet" />
</asp:Content>



