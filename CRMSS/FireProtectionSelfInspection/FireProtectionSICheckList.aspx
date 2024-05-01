<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FireProtectionSICheckList.aspx.cs" Inherits="FireProtectionSelfInspection_FireProtectionSICheckList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    

    
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>E-Connect</title>

    <link rel="stylesheet" type="text/css" href="assets/style.css"/>
    <link rel="stylesheet" href="../Masters/css/home.css" type="text/css" />
    <link rel="stylesheet" href="../Masters/css/e-connect.css" type="text/css" />
       <link rel="stylesheet" href="https://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>   
      <script type="text/javascript">
          var $jnine = jQuery.noConflict();
    </script>
     
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    
    <link rel="icon" href="assets/images/fav_icon.png" type="image/png" sizes="24x24"/>


        <link rel="icon" type="image/x-icon" href="~/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"

       
      rel="stylesheet"/>
    

     <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../Dashboard/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../Dashboard/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../Dashboard/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../Dashboard/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../Dashboard/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="../Dashboard/assets/vendor/libs/apex-charts/apex-charts.css" />
    <!-- Page CSS -->
    <!-- Helpers -->
    <script src="../Dashboard/assets/vendor/js/helpers.js"></script>
    <script src="../Dashboard/assets/js/config.js"></script>
    <script src="../Dashboard/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../Dashboard/assets/vendor/libs/popper/popper.js"></script>
    <script src="../Dashboard/assets/vendor/js/bootstrap.js"></script>
    <script src="../Dashboard/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <%-- for Accordation --%>

    <style>
        html, body {
            height: 100%;
            margin: 0;
            overflow-y: auto;
            width: 100%;
            /*background-image: url("assets/images/background3.jpg");*/
            background-size: cover;
            background-color: #80808000 !important;
        }

        .ui-autocomplete {
            width: auto !important;
            margin-right: 25px !important;
        }

        .file-upload {
            display: none;
        }

        .circle {
            border-radius: 100% !important;
            overflow: hidden;
            border: 2px solid rgba(255, 255, 255, 0.2);
            padding-top: 25Px;
        }

        .profile-pic {
            width: 150px;
            max-height: 200px;
            display: inline-block;
        }

        .profile-picico {
            display: inline-block;
            vertical-align: middle;
            width: 35px;
            height: 35px;
            border-radius: 50%;
            border-color: #fb0000;
            border-style: solid;
            border-width: 2px;
        }

          .hdigfnt	
        {	
            font-family: "Times New Roman", Times, serif;	
            font-size: 28px;	
            font-weight: bold;	
            color: #bc3c3c;	
            text-decoration: underline;	
        }	

           .panl14{	
             border-color:Silver;	
             border-width:1px;	
             border-style:Solid;	
             background-color: #364150;
             height: 62px;
        }

        .headerdiv {
            border-color: #818181;
            border-width: 1px;
            border-style: Solid;
            padding-bottom: 40px;
            padding-top: 5px;
            padding-left: 10px;
        }

          .subpnlhdg {
            color: white;
            font-size: 18px;
        }

        .carditems {
            width: 97%;
           
            border-radius: 5px !important;
            left: 26px;
            margin-top: 15px;
        }

        .btn-Search {
            border-radius: 18px !important;
            background-color: #1a73ba !important;
            font-size: 13px !important;
            padding: 6px 15px !important;
            outline: none !important;
            border: none !important;
            color: #fff;
        }

         .btn-Search {
            border-radius: 18px !important;
            background-color: #1a73ba !important;
            font-size: 13px !important;
            padding: 6px 15px !important;
            outline: none !important;
            border: none !important;
            color: #fff;
        }

         .btn-addnew
         {
              border-radius: 18px !important;
            background-color: #a92828 !important;
            font-size: 13px !important;
            padding: 6px 15px !important;
            outline: none !important;
            border: none !important;
            color: #fff;
         }

          .modalBackground {
            height: 100%;
            background-color: #000000;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }


        .table > :not(caption) > * > * {
            padding: 0.625rem 1.25rem;
            background-color: var(--bs-table-bg);
             border-bottom-width: 0px !important; 
            box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
        }

        .calclr {
        
            background-color: rgba(165, 156, 81, 0.67);
         
        }


        .popupproject {
            border-radius: 5px !important;
            background-color: white !important;
            padding-left: 7px;
            padding-top: 7px;
            float: left;
            padding-right: 7px;
            width: 30%;
            padding-bottom: 7px;
            position: fixed;
            z-index: 100001;
            left: 856px;
            top: 64.5px;
        }

        .popuptab {
            border-radius: 5px !important;
            background-color: white !important;
            padding-left: 7px;
            padding-top: 4px;
            float: left;
            padding-right: 7px;
            width: 50%;
            padding-bottom: 7px;
            position: fixed;
            z-index: 100001;
            left: 192px;
            top: 88.5px;
         
        }




        @media (min-width: 700px) and (max-width: 900px) {
           .popupproject {

            border-radius: 5px !important;
            background-color: white !important;
            padding-left: 7px;
            padding-top: 4px;
            float: left;
            padding-right: 7px;
            width: 50%;
            padding-bottom: 7px;
            position: fixed;
            z-index: 100001;
            left: 192px;
            top: 88.5px;
               
            }

        }

        @media only screen and (max-width : 800px) and (max-height : 1340px) {
            .popupproject {
                border-radius: 5px !important;
                background-color: white !important;
                padding-left: -30px;
                padding-top: 4px;
                float: left;
                padding-right: 7px;
                width: 50%;
                padding-bottom: 7px;
                position: fixed;
                z-index: 100001;
                left: 192px;
                top: 88.5px;
            }
            label.text{
                font-size:8px;
            }
        }
                    
</style>


</head>
<body>
   <form id="form1" runat="server" >
       <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always" >
           <ContentTemplate>
               <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>

               <header>
                   <nav
                       class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                       id="layout-navbar">
                       <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                           <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                               <i class="bx bx-menu bx-sm"></i>
                           </a>
                       </div>

                       <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                           <!-- Logo -->
                           <div class="app-brand demo">
                               <a href="" class="app-brand-link">
                                   <span class="app-brand-logo demo">
                                       <img src="../Dashboard/assets/img/avatars/e-connect logo white.png" style="height: 57px;"
                                           alt="View Badge User"
                                           data-app-dark-img="illustrations/man-with-laptop-dark.png"
                                           data-app-light-img="illustrations/man-with-laptop-light.png" />
                                       <%--<img src="../Dashboard/assets/img/avatars/naffco-logoWhite.png" style="height: 57px;"
                                       --%>

                                   </span>
                               </a>
                               <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                                   <i class="bx bx-chevron-left bx-sm align-middle"></i>
                               </a>
                           </div>
                           <!--naffco Logo-->

                           <div class="app-brand demo" style="padding-left: 35%">
                               <a href="" class="app-brand-link">
                                   <span class="app-brand-logo demo">
                                       <img src="../Dashboard/assets/img/avatars/naffco-logoWhite.png" style="height: 57px;"
                                           alt="View Badge User"
                                           data-app-dark-img="illustrations/man-with-laptop-dark.png"
                                           data-app-light-img="illustrations/man-with-laptop-light.png" />
                                       <%--<img src="../Dashboard/assets/img/avatars/naffco-logoWhite.png" style="height: 57px;"
                                       --%>

                                   </span>
                               </a>
                               <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                                   <i class="bx bx-chevron-left bx-sm align-middle"></i>
                               </a>
                           </div>
                           <%-- NavBar --%>

                           <nav class="navbar navbar-expand-lg navbar-light bg-light">
                               <div class="container-fluid">
                               </div>
                           </nav>
                           <%-- Search --%>
                           <ul class="navbar-nav flex-row align-items-center ms-auto">
                            
                               <!-- User -->
                               <li class="nav-item navbar-dropdown dropdown-user dropdown">
                                   <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                                       <div class="avatar avatar-online">
                                           <img src="../Dashboard/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" id="imgvatar" />
                                       </div>
                                   </a>
                                   <ul class="dropdown-menu dropdown-menu-end">
                                       <li>
                                           <a class="dropdown-item" href="#">
                                               <div class="d-flex">
                                                   <div class="flex-shrink-0 me-3">
                                                       <div class="avatar avatar-online">
                                                           <img src="../Dashboard/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" id="imgavatar2" />
                                                       </div>
                                                   </div>
                                                   <div class="flex-grow-1">
                                                       <span class="fw-semibold d-block">
                                                           <asp:Label ID="lblUser" runat="server" Text="Navas"></asp:Label></span>
                                                       <small class="text-muted">
                                                           <asp:Label ID="lblRoleName" runat="server" Text="Admin"></asp:Label></small>
                                                   </div>
                                               </div>
                                           </a>
                                       </li>
                                       <li>
                                           <div class="dropdown-divider"></div>
                                       </li>

                                       <li>
                                           <asp:LinkButton ID="BtnEditProfile" runat="server"  CssClass="dropdown-item">
                        <i class="bx bx-user ddlitems">&nbspEdit Profile</i></asp:LinkButton>
                                       </li>

                                       <li>

                                           <asp:LinkButton ID="BtnChangePassword" runat="server"  CssClass="dropdown-item">
                        <i class="bx bx-lock ddlitems">&nbspChangePassword</i> </asp:LinkButton>

                                       </li>


                                       <li>

                                           <asp:LinkButton ID="BtnMessages" runat="server"  CssClass="dropdown-item">
                         <i class="bx bx-message-rounded ddlitems">&nbspMessage</i> 
                         <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
                                           </asp:LinkButton>


                          
                                       </li>
                                       <li>
                                           <asp:LinkButton ID="BtnTags" runat="server" CssClass="dropdown-item">
                         <i class="bx bx-purchase-tag ddlitems">&nbspTags</i> 
                         <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">2</span>
                                           </asp:LinkButton>
                                       </li>

                                       <li>
                                           <asp:LinkButton ID="BtnTasks" runat="server"  CssClass="dropdown-item">
                         <i class="bx bx-task ddlitems">&nbspTasks</i> 
                         <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">5</span>
                                           </asp:LinkButton>
                                       </li>

                                       <li>
                                           <div class="dropdown-divider"></div>
                                       </li>

                                       <li>
                                           <a class="dropdown-item" href="../Security/logout.aspx">
                                               <i class="bx bx-power-off me-2"></i>
                                               <span class="align-middle">Log Out</span>
                                           </a>
                                       </li>

                                   </ul>
                               </li>
                           </ul>
                       </div>
                   </nav>
               </header>

               <asp:Panel ID="PnlProjectDetails" runat="server" Visible="true">
                   <div id="Div2" runat="server">
                       <div class="card carditems" style="border-radius: 5px !important;left: 12px!important;">
                         
                           <asp:Panel ID="Panel3" runat="server" CssClass="panl14">

                               <div class="card-header" style="padding-top: 14px;">

                                   <div class="pull-left">

                                       <h4>
                                           <asp:Label ID="Label1" class="hdigfnt" Style="color: white;" runat="server" Text="Fire Protection Projects"></asp:Label></h4>

                                   </div>

                                   <div class="pull-right">
                                       <asp:Button runat="server" ID="BtnNewProjectAdd" OnClick="BtnNewProjectAdd_Click" CssClass="btn btn btn-addnew" Text="Add New Project"></asp:Button>
                                   </div>

                                 
                                   <%-- Grid-Project --%>

                                 
                               </div>
                           </asp:Panel>
                           <div class="card-block">

                                 <%-- ******NEW ASP MODAL POUP --%>



                                      <cc1:ModalPopupExtender ID="MdlAddNewProject" runat="server" PopupControlID="PnlAddNewProject" TargetControlID="btnclose1"
                                       Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior17" RepositionMode="RepositionOnWindowResizeAndScroll"
                                       CancelControlID="btnclose1" BackgroundCssClass="modalBackground">
                                   </cc1:ModalPopupExtender>

                                   <asp:Panel ID="PnlAddNewProject" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px">
                                       <div class="popupproject">
                                          
                                           <div class="modal-header panl14" style="font-family: system-ui;">

                                               <div class="pull-left">

                                                   <h4>
                                                       <asp:Label ID="lblAddNewProject" class="subpnlhdg" runat="server" Text="Add New Project"></asp:Label>
                                                   </h4>

                                               </div>


                                               <div class="pull-right">

                                                   <asp:Button runat="server" ID="btnclose1" Text="X" class="btn btn-update" data-dismiss="modal" CssClass="btn btn-default"></asp:Button>

                                               </div>

                                           </div>

                                           <table class="table table-condensed" style="margin-top: 1px !important;">

                                                <tr>
                                                   <td style="padding: 3px 5px; border-top: 0px;" class="label-alignment no-border">
                                                       <asp:Label runat="server" Text="Project Number" CssClass="formlbl labelsp" ID="Label4"></asp:Label>

                                                       <asp:TextBox runat="server" type="text" ID="prjctnumber" Width="88%" class="form-control" />
                                                   </td>
                                               </tr>


                                               <tr>
                                                   <td style="padding: 3px 5px; border-top: 0px;" class="label-alignment no-border">
                                                       <asp:Label runat="server" Text="Project Name" CssClass="formlbl labelsp" ID="lbllocation"></asp:Label>

                                                       <asp:TextBox runat="server" type="text" ID="txtprojectname" Width="88%" class="form-control" />
                                                   </td>
                                               </tr>

                                                <tr>
                                                    <td style="padding: 3px 5px; border-top: 0px;" class="label-alignment no-border">
                                                        <asp:Label runat="server" Text="Date" CssClass="formlbl labelsp" ID="Label6"></asp:Label>

                                                        <asp:TextBox ID="txtprjctdate" runat="server" TextMode="SingleLine" Width="88%" CssClass="textBox1 form-control" AccessKey="a"></asp:TextBox>
                                                        <ajax:CalendarExtender ID="dtDate" runat="server" Format="dd/MM/yyyy" TargetControlID="txtprjctdate" CssClass="MyCalendar calclr">
                                                        </ajax:CalendarExtender>
                                                    </td>
                                                </tr>

                                               <tr>
                                                   <td style="padding: 3px 5px; border-top: 0px;" class="label-alignment no-border">
                                                       <asp:Label runat="server" Text="Descrption" CssClass="formlbl labelsp" ID="lblcontractvalue"></asp:Label>
                                                        <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="txtdescription" Width="88%"  Rows="3"></asp:TextBox>
                                                   </td>

                                               </tr>


                                               <tr>
                                                   <td style="float: right; border-top: 0px;">
                                           
                                                       <asp:Button runat="server" ID="btnSaveProjects" CssClass="btn btn-success" Text="Save" OnClick="btnSaveProjects_Click" data-Submit="modal"></asp:Button>
                                                         
                                                   </td>
                                                   

                                               </tr>

                                           </table>

                                       </div>

                                   </asp:Panel>


                                   <%-- Edit Modal --%>

                                 <asp:GridView ID="gdvProjectList" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvProjectList_RowCommand"
                                       RowStyle-BackColor="White" Width="100%"
                                       EmptyDataText="There are no records to display."
                                       CssClass="GridAltItem" AllowSorting="True" DataKeyNames="Id" Font-Names="Calibri" BackColor="#c7d3d2" BorderColor="#E3EAEB" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
                                       <FooterStyle CssClass="GridFooter" BackColor="#009688" />
                                       <RowStyle CssClass="GridItem" BorderColor="#CCCCCC" Height="40px" VerticalAlign="Middle" />
                                     
                                       <Columns>

                                           <asp:BoundField DataField="Id" HeaderText="Id" ControlStyle-Width="5%" SortExpression="Id" ItemStyle-HorizontalAlign="Center" Visible="False" ReadOnly="true" />

                                           <asp:BoundField DataField="ProjectNumber" HeaderText="Project Number" SortExpression="Projectnumber" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />
                                           <asp:BoundField DataField="ProjectName" HeaderText="Project Name" SortExpression="ProjectName" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />

                                           <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />
                                           <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />




                                           <asp:TemplateField HeaderText="Actions" ItemStyle-Width="10%"  Visible="true" ItemStyle-HorizontalAlign="Center">
                                               <ItemTemplate>
                                                  <div style="display: inline-flex;">
                                                   <asp:LinkButton ID="lblView" runat="server" Style="text-align: center" CommandName="ViewProjectDetails" CommandArgument='<%#Eval("Id")+";"+Eval("ProjectNumber")+";"+Eval("ProjectName")+";"+Eval("Date")+";"+Eval("Description")%>'><i class="fa fa-eye" title="View" style="padding-right: 10px;font-size: large;" ></i></asp:LinkButton>
                                                   <asp:LinkButton ID="lbEdit" runat="server" Style="text-align: center" CommandName="EditProject" CommandArgument='<%#Eval("Id")+";"+Eval("ProjectNumber")+";"+Eval("ProjectName")+";"+Eval("Date")+";"+Eval("Description")%>' ><i class="fa fa-edit" title="Edit" style="padding-right: 10px;font-size: large;" ></i></asp:LinkButton>
                                                   </div>
                                               </ItemTemplate>
                                               <ItemStyle HorizontalAlign="Center" Width="10%" />
                                           </asp:TemplateField>




                                       </Columns>

                                       <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#00968826" ForeColor="DarkSlateBlue" />
                                       <SelectedRowStyle CssClass="GridRowOver" BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                       <EditRowStyle />
                                       <AlternatingRowStyle CssClass="GridAltItem" BackColor="#E3EAEB" />
                                       <SortedAscendingCellStyle BackColor="#FAFAE7" />
                                       <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                                       <SortedDescendingCellStyle BackColor="#E1DB9C" />
                                       <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                                       <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" BackColor="#009688" Font-Bold="True" />
                                   

                                   </asp:GridView>

                         </div>
                       </div>
                   </div>


               </asp:Panel>


               <asp:Panel ID="pnlItem" runat="server" Visible="false">

                   <div id="Div1" runat="server">
                       <div class="card carditems" style="border-radius: 5px !important;left: 12px!important;"">



                           <asp:Panel ID="Panel1" runat="server" CssClass="panl14">

                               <div class="card-header" style="padding-top: 14px;">
                                   <div class="row">
                                       <div class="col-sm-8">
                                           <div class="pull-left">
                                       <h4>
                                           <asp:Label ID="Label7" class="hdigfnt" Style="color: white; font-size:27px" runat="server" Text="Fire Protection Self Inspection"></asp:Label></h4>
                                   </div>
                                       </div>
                                       <div class="col-sm-4"><asp:Button runat="server" ID="Button1" class="btn btn-Search" Text="SAVE" OnClick="btnSaveDetails_Click" />
                                       <asp:Button runat="server" ID="Button2" class="btn btn-Search" Text="BACK" OnClick="ButtonBack_Click" />   </div>

                                   </div>
                                  
                                 <%--  <div class="pull-left">
                                       <h4>
                                           <asp:Label ID="Label18" class="hdigfnt" Style="color: white; font-size:27px" runat="server" Text="Fire Protection Self Inspection"></asp:Label></h4>
                                   </div>
                                                                     
                                   <div class="pull-right">
                                      <asp:Button runat="server" ID="btnSaveDetails" class="btn btn-Search" Text="SAVE" OnClick="btnSaveDetails_Click" />
                                       <asp:Button runat="server" ID="ButtonBack" class="btn btn-Search" Text="BACK" OnClick="ButtonBack_Click" />            

                                   </div>--%>

                               </div>
                           </asp:Panel>



                           <div class="card-block">
                          
                            <asp:Panel ID="Panel4" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="#818181" BackColor="White">
                                <table class="table table-condensed" style="width: 100%; padding-top: 17px; font-size: 13px;">
                                    <tr style="font-size: 13px;">

                                        <td style="width: 2%" class="label-alignment no-border">
                                            <asp:Label ID="Label2" runat="server" Text="Project Number"></asp:Label>
                                        </td>
                                        <td style=" width: 4%" class="no-border">
                                            <asp:TextBox ID="txtprojectnumber" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                            <asp:HiddenField ID="hfdPId" runat="server" />
                                        </td>

                                        <td style="width: 3%" class="label-alignment no-border">
                                            <asp:Label ID="Label17" runat="server" Text="Project Name"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px; width: 10%" class="no-border">
                                            <asp:TextBox ID="txtprojectnameline" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                        </td>

                                        <td style="width: 1%" class="label-alignment no-border">
                                            <asp:Label ID="Label3" runat="server" Text="Date"></asp:Label>
                                             
                                        </td>
                                        <td style="padding: 3px 5px; width: 6%" class="no-border">
                                            <asp:TextBox ID="txtdateline" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                        </td>
                                        
                                        <td style=" width: 1%" class="label-alignment no-border">
                                            <asp:Label ID="Label5" runat="server" Text="Description"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px; width: 8%" class="no-border">
                                           
                                            <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="txtdescriptionIns"  Rows="3"></asp:TextBox>
                                        </td>

                                    </tr>
                                 
                                </table>
                            </asp:Panel>



                               <%-- Grid --%>
                              

                            <asp:GridView ID="gdvCheckItemsList" runat="server" AutoGenerateColumns="False"  
                            RowStyle-BackColor="White" Width="100%"   
                            EmptyDataText="There are no records to display."
                            CssClass="GridAltItem" AllowSorting="True" DataKeyNames="Id" Font-Names="Calibri" BackColor="#c7d3d2" BorderColor="#009688" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
                            <FooterStyle CssClass="GridFooter" BackColor="#009688" />
                            <RowStyle CssClass="GridItem" BorderColor="#CCCCCC" Height="40px" VerticalAlign="Middle" />
                               
                            <Columns>
                                
                <asp:TemplateField HeaderText="Sl.No" Visible="true">
                                         <HeaderStyle Font-Size="Small" Width="3%" />
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                         <ItemTemplate>
                                             <asp:Label ID="lblId" runat="server"  Style="text-align: center" Text='<%#Eval("ID")%>' ></asp:Label>
                                             
                                         </ItemTemplate>
                                     </asp:TemplateField>



                                  <asp:TemplateField HeaderText="Descrption" ItemStyle-Width="15%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                       <asp:Label runat="server" Id="lblGdvDescrption"  Text='<%#Eval("Descrption")%>'></asp:Label>    
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                </asp:TemplateField>

                               
                              
                                <asp:TemplateField HeaderText="Answer" ItemStyle-Width="15%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                      
                                     <asp:RadioButtonList runat="server" ID="rbtYesNo"> 
                                         <asp:ListItem Text="YES" Value="YES"></asp:ListItem>
                                         <asp:ListItem Text="NO" Value="NO"></asp:ListItem>
                                     </asp:RadioButtonList>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                </asp:TemplateField>


                                 <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="15%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                       <asp:TextBox runat="server" TextMode="MultiLine" Rows="3" ID="txtgdvRemarks"  Columns="25"></asp:TextBox>    
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                </asp:TemplateField>

                            </Columns>
                            <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#00968826" ForeColor="DarkSlateBlue" />
                            <SelectedRowStyle CssClass="GridRowOver" BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                            <EditRowStyle />
                            <AlternatingRowStyle CssClass="GridAltItem" BackColor="#E3EAEB" /> 
                            <SortedAscendingCellStyle BackColor="#FAFAE7" />
                            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                            <SortedDescendingCellStyle BackColor="#E1DB9C" />
                            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                            <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" BackColor="#009688" Font-Bold="True" />

                        </asp:GridView>

                             
                           </div>
                       </div>


                   </div>
                   
               </asp:Panel>


               </ContentTemplate>
           </asp:UpdatePanel>
       </form>
</body>
</html>
