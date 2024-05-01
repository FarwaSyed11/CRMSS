<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LOSTOPTview.aspx.cs" Inherits="CRMAdmin_LOSTOPTview" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>E-Connect</title>
      
    <link rel="icon" type="image/x-icon" href="~/assets/img/favicon/favicon.ico" />
     <link rel="icon" href="../Masters/images/ecnew.jpg" type="image/jpg" sizes="70x70"/>
           <link rel="stylesheet" href="https://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>   
      <script type="text/javascript">
          var $jnine = jQuery.noConflict();
    </script>
 
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"  rel="stylesheet"/>
    
    
     <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="~/Dashboard/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="~/Dashboard/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="~/Dashboard/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="~/Dashboard/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="~/Dashboard/assets/vendor<%...%>/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="~/Dashboard/assets/vendor/libs/apex-charts/apex-charts.css" />
    <!-- Page CSS -->
    <!-- Helpers -->
    <script src="../Dashboard/assets/vendor/js/helpers.js"></script>
    <script src="../Dashboard/assets/js/config.js"></script>
    <script src="../Masters/script/Econnectjs.js"></script>
    <script src="../Dashboard/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../Dashboard/assets/vendor/libs/popper/popper.js"></script>
    <script src="../Dashboard/assets/vendor/js/bootstrap.js"></script>
    <script src="../Dashboard/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
  <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />
     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

  
    <script src="../js/jquery-1.11.2.min.js"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>
    


    <script src="../js/jquery-1.11.2.min.js"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>
     <script language="javascript" type="text/javascript">
         function Focus(objname, waterMarkText) {
             obj = document.getElementById(objname);
             if (obj.value == waterMarkText) {
                 obj.value = "";
                 obj.className = "NormalTextBox form-control";
             }
         }
         function Blur(objname, waterMarkText) {
             obj = document.getElementById(objname);
             if (obj.value == "") {
                 obj.value = waterMarkText;
                 obj.className = "WaterMarkedTextBox form-control";
             }
             else {
                 obj.className = "NormalTextBox form-control";
             }
         }


     </script>
    <style>


        /* -------------------------------------------------------------*/


        .navnew {    
  display: block;
  text-align: center;

}
.navnew ul {
  margin: 0;
  padding:0;
  list-style: none !important;
     
  
}
.navnew a {
  display:block; 
  background: #1110; 
  color: #fff; 
  text-decoration: none;
  padding: 0.8em 1.8em;
  text-transform: uppercase;
  font-size: 80%;
  letter-spacing: 2px;
  text-shadow: 0 -1px 0 #111;
  position: relative;
}
.navnew{  
  vertical-align: top; 
  display: inline-block;
  box-shadow: 
    1px -1px -1px 1px #000, 
    -1px 1px -1px 1px #fff, 
    0 0 6px 3px #fff;
  border-radius:6px;
     padding-left: 30%;

    width: max-content;
        padding-top: 1%;

}
.navnew li {
  position: relative;
  list-style: none !important;
}
.navnew > li { 
  float: left; 
  border-bottom: 4px #aaa solid; 
  margin-right: 1px; 
} 
.navnew > li > a { 
  margin-bottom: 1px;
  box-shadow: inset 0 2em .33em -0.5em #5550; 
}
.navnew > li:hover, 
.navnew > li:hover > a { 
  border-bottom-color: white;
}
.navnew li:hover > a { 
  color:black; 
  background-color: #a92828;
}
.navnew > li:first-child { 
  border-radius: 4px 0 0 4px;
} 
.navnew > li:first-child > a { 
  border-radius: 4px 0 0 0;
}
.navnew > li:last-child { 
  border-radius: 0 0 4px 0; 
  margin-right: 0;
} 
.navnew > li:last-child > a { 
  border-radius: 0 4px 0 0;
}
.navnew li li a { 
  margin-top: 1px !important;
 text-align: center;
     border-bottom: thin;
    border-bottom-color: white;

}


.navnew li a:first-child:nth-last-child(2):before { 
  content: ""; 
  position: absolute; 
  height: 0; 
  width: 0; 
  border: 5px solid transparent; 
  top: 50% ;
  right:2px;  
 }


.navnew ul {
  position: absolute;
  white-space: nowrap;
  background: #111111cf !important; 
  z-index: 1;
  left: -99999em;
}
.navnew > li:hover > ul {
  left: auto;
  margin-top: 5px;
  min-width: 100%;
}
.navnew > li li:hover > ul { 
  left: 100%;
  margin-left: 2px;
  top: -1px;
  
}
/* arrow hover styling */
.navnew > li > a:first-child:nth-last-child(2):before { 
  border-top-color: #aaa; 
}
.navnew > li:hover > a:first-child:nth-last-child(2):before {
  border: 5px solid transparent; 
  border-bottom-color: white; 
  margin-top:-5px
}
.navnew li li > a:first-child:nth-last-child(2):before {  
  border-left-color: #aaa; 
  margin-top: -5px
}
.navnew li li:hover > a:first-child:nth-last-child(2):before {
  border: 5px solid transparent; 
  border-right-color: white;
  right: 10px; 
}



         /* -------------------------------------------------------------*/








        body {
            background-image: url("assets/img/avatars/background.jpg") !important;
            background-size: cover;
            /*background-color: gray;*/
        }

        .ddlitems {
            font-family: 'Cambria Math';
            font-weight: bold;
            font-size: medium;
        }

        .modalBackground {
            height: 100%;
            background-color: #000000;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }

        .modal-header {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: start;
            -ms-flex-align: start;
            align-items: flex-start;
            -webkit-box-pack: justify;
            -ms-flex-pack: justify;
            justify-content: space-between;
            padding: 1rem;
            border-bottom: 3px solid #364150;
            border-top-left-radius: 0.3rem;
            border-top-right-radius: 0.3rem;
        }

        .profileimg {
            vertical-align: middle;
            width: 150px;
            height: 150px;
            border-radius: 50%;
        }

        .mdlchangepas {
            width: 87%;
            max-width: 100%;
            margin-bottom: 2rem;
            margin-top: 2rem;
            background-color: transparent;
            border:none;
            border-bottom-width:0px !important;
        }

        .navbar1 {
            background-color: black;
            overflow: hidden;   
            margin-left: 18%;

            /*width:55%;*/

        }

            .navbar1 a {
                text-decoration: none;
                text .algin: center;
                padding: 14px 16px;
                float: left;
                color: white;
            }

                .navbar1 a:hover {
                    background-color: black;
                }

        .dropdown1 {
            float: left;
            overflow: hidden;
        }

            .dropdown1 .dropbtn1 {
                text-decoration: none;
                text-align: center;
                padding: 18px 40px;
                color: aliceblue;
                float: left;
                border: none;
                outline: none;
                background-color: #a92828; 
            }

            .navbar1 a:hover, .dropdown1:hover .dropbtn1 {
                background-color: #a92828;
            }

        .content1 {
            position: absolute;
            min-width: 160px;
            z-index: 1;
            box-shadow: 0px 1px 1px 1px black;
            margin-top: 60px;
            display: none;
            font-family: math;
            font-size: 16px;
            font-weight:normal;
        }

            .content1 a {
                display: block;
                float: none;
                background-color: #000000c9;
                text-decoration: none;
                text-align: left;
                padding: 14px 16px;
              
            }

        .dropdown1:hover .content1 {
            display: block;
        }
         .ui-autocomplete {
        width:auto !important;
        margin-right:25px !important;
        
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
        .upload-button {
            font-size: 1.2em;
        }

            .upload-button:hover {
                transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
                color: #999;
            }
        .rowse {
             
            margin-left: -15px;
        }


        .p-image {
           
            top: 217px;
            right: 404px;
            color: #666666;
            transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
        }

            .p-image:hover {
                transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
            }
             .modalBackground {
            height: 100%;
            background-color: #000000;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }
             .ui-menu .ui-menu-item {

    border-bottom: solid;
    border-bottom-width: 1px;
    border-bottom-color: silver;
    box-shadow: 0 4px 8px 0 rgb(0 0 0 / 20%);
    transition: 0.3s;
}
             .ui-menu-item:hover {
 box-shadow: 0 10px 16px 0 rgb(106 106 106 / 53%);
     zoom: 1.03;
}

    </style>
    <style type="text/css">
    .FileUploadClass input[type=text]
    {
        display: none;
    }
    .FileUploadClass div
    {
        background:transparent !important;
        background:url(../images/profile/upload.png) no-repeat !important;
         margin-left: 23.5%;
    }
        
       
    </style>
   
    <%-- Accordion  tab   view--%>
    <script>
        $(document).ready(function () {

            $('.nav-link').on('click', function () {
                if (!$('#collapseB').hasClass('show')) {
                    $('#collapseB').collapse('toggle')
                }
            })
        });
    </script>
   
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
          
        <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>

    <div>      
        <div class="layout-wrapper layout-content-navbar">        
          <!-- Navbar -->
           
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
                       <a href="/Masters/econnect.aspx" class="app-brand-link">
                           <span class="app-brand-logo demo">
                               <img src="../Dashboard/assets/img/avatars/e-connect logo white.png" style="height: 57px;"
                                   alt="View Badge User"
                                   data-app-dark-img="illustrations/man-with-laptop-dark.png"
                                   data-app-light-img="illustrations/man-with-laptop-light.png" />
                           </span>
                       </a>
                       <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                           <i class="bx bx-chevron-left bx-sm align-middle"></i>
                       </a>
                   </div>

                <%-- NavBar --%>
                   <asp:Literal ID="ltrlMenu" runat="server"></asp:Literal>
              

             
                <%-- Search --%>
     
            </div>
          </nav>
      


        <div class="layout-overlay layout-menu-toggle"></div>
     
   </div>
        <div   style="width: calc(100% - (1.625rem * 2));margin: 0.75rem auto 0;">
       
               <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
             <asp:Panel ID="pnlDetailView" runat="server" Visible="false">
             
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                           <asp:Panel ID="Panel3" runat="server" CssClass="pnlheading">
                            <div class="pull-left" >
                            <h3>
                                <asp:Label ID="Label8" ForeColor="White" Font-Bold="true" runat="server" Text="LOST Opportunity"></asp:Label>
                                
                            </h3>
                                </div>
                               <div class="pull-right">
                                 
                               </div>

                            </asp:Panel>
                        <div class="card-block" style="font-weight:bold;">
                             <asp:Panel ID="Panel9" runat="server" CssClass="pnlsubheading">
                                 
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label45" ForeColor="White" Font-Bold="true" runat="server" Text="Opportunity Details"></asp:Label></h5>
                                 </div>
                                 </asp:Panel>
                        <asp:Panel ID="pnlView" runat="server">
                        <div style="padding-bottom:1%;padding-top:1%">

                         <table class="table table-condensed" style="width: 100%">
                             <tr>
									 
				
									 <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
										 <asp:Label ID="Label19" runat="server" Text="Opportunity Number"></asp:Label>
										 <asp:HiddenField ID="hfdOptId" runat="server" />
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">

										 <asp:TextBox ID="txtOptNo" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
									 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label20" runat="server" Text="Name"></asp:Label>
									 </td>

									 <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtName" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="lblClient" runat="server" Text="Developer Client"></asp:Label>
                                         </td>
                                      <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtClient" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label1" runat="server" Text="Developer Owner"></asp:Label>
                                         </td>
                                     <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtOwner" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                 </tr>
                             <tr>
                                 <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
										 <asp:Label ID="Label2" runat="server" Text="Main Contractor"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtContractor" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label3" runat="server" Text="Main Contractor Owner"></asp:Label>
                                         </td>
                                      <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtMContractor" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label4" runat="server" Text="MEP Contractor"></asp:Label>
                                         </td>
                                      <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtMEPContractor" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label5" runat="server" Text="Salesman"></asp:Label>
                                         </td>
                                     <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtSalesman" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                             </tr>
                             <tr>
                                     <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
										 <asp:Label ID="Label6" runat="server" Text="Country"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtCountry" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label7" runat="server" Text="City"></asp:Label>
                                         </td>
                                      <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="tctCity" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label9" runat="server" Text="Sales Stage"></asp:Label>
                                         </td>
                                     <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtSalesStage" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label10" runat="server" Text="Status"></asp:Label>
                                         </td>
                                     <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtStatus" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                             </tr>
                             </table>
                            </div>
                            </asp:Panel>

                             <%--  three panels start --%>
                               <div class="row">
                                <div class="pull-left" style="width: 33.33%">
                                    <asp:Panel ID="Panel2" runat="server" CssClass="pnlsubheading">
                                        <div class="pull-left">
                                            <h5>
                                                <asp:Label ID="Label15" class="panel-heading" Style="color: white;" runat="server" Text="Salesman"></asp:Label>
                                              
                                                   </h5>  </div>
                                        <div class="pull-right" style="margin-top:-8px;padding-right:1%">
                                            <asp:LinkButton ID="lblSalesUpdateHistory" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lblSalesUpdateHistory_Click"><i class="fa fa-history" title="Salesman Update History"></i></asp:LinkButton>
                                        </div>
                                    </asp:Panel>

                                    <%-- Grid view Sales Lost Reason --%>
                                    <asp:Panel ID="pnlSales" runat="server" BorderStyle="Solid" BorderWidth="1px">

                                    <asp:GridView ID="gdvSalesLost" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                        AllowSorting="True" EmptyDataText="No Data Found.." AllowPaging="true" Font-Bold="false"
                                        class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                        <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>

                                             <asp:TemplateField HeaderText="Lost Reason" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:TextBox TextMode="MultiLine" Rows="3" Enabled="false" Columns="25" ID="txtReason" Text='<%#(Eval("LostReason").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Competitor" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lb1" Text='<%#(Eval("Competitor").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Lost Date" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lb2" Text='<%#(Eval("LostDate").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remark" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:TextBox TextMode="MultiLine" Rows="3" Enabled="false" Columns="25" ID="txtsalesremarks" Text='<%#(Eval("SalesmanNotes").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>
                                        

                                           

                                        </Columns>

                                        <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                                <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                    </asp:GridView>
                                        </asp:Panel>



                                </div>
                                <div class="pull-left" style="width: 33.33%">
                                        <asp:Panel ID="Panel4" runat="server" CssClass="pnlsubheading">
                                        <div class="pull-left">
                                            <h5>
                                                <asp:Label ID="Label18" class="panel-heading" Style="color: white;" runat="server" Text="Sales Manager"></asp:Label>
                                                    </h5>

                                        </div>
                                            <div class="pull-right" style="margin-top:-8px;padding-right:1%">
                                      <asp:LinkButton ID="lbSMUpdateHistory" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbSMUpdateHistory_Click"><i class="fa fa-history" title="Sales Manager Update History"></i></asp:LinkButton>
                                        </div>
                                    </asp:Panel>
                                    <%-- Grid view sales manager Lost Reason --%>
                                    <asp:Panel ID="Panel6" runat="server" BorderStyle="Solid" BorderWidth="1px">
                                    <asp:GridView ID="gdvSMLost" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                        AllowSorting="True" EmptyDataText="No Data Found.." AllowPaging="true" Font-Bold="false"
                                       class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>

                                            <asp:TemplateField HeaderText="Lost Reason" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:TextBox TextMode="MultiLine" Rows="3" Enabled="false" Columns="25" ID="txtReason" Text='<%#(Eval("SMReason").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Competitor" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustomerName" Text='<%#(Eval("SMCompetitor").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remark" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:TextBox TextMode="MultiLine" Rows="3" Enabled="false" Columns="25" ID="txtsalesremarks" Text='<%#(Eval("SMNotes").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>
                                          

                                        </Columns>

                                        
                                <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                                <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                    </asp:GridView>
                                        </asp:Panel>

                                </div>
                                <div class="pull-left" style="width: 33.33%">

                                        <asp:Panel ID="Panel5" runat="server" CssClass="pnlsubheading">
                                        <div class="pull-left">
                                            <h5>
                                                <asp:Label ID="Label29" class="panel-heading" Style="color: white;" runat="server" Text="Marketing"></asp:Label>
                                                </h5>
                                                  </div>
                                            <div class="pull-right" style="margin-top:-8px;padding-right:1%">
                                              <asp:LinkButton ID="lbMKTUpdateHistory" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbMKTUpdateHistory_Click"><i class="fa fa-history" title="Marketing Update History"></i></asp:LinkButton>
                                        </div>
                                    </asp:Panel>
                                    <%-- Grid view  MArketing Lost Reason--%>
                                    <asp:Panel ID="Panel7" runat="server" BorderStyle="Solid" BorderWidth="1px">
                                    <asp:GridView ID="gdvMKTLost" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                        AllowSorting="True" EmptyDataText="No Data Found.." AllowPaging="true" Font-Bold="false"
                                         class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>

                                           <asp:TemplateField HeaderText="Lost Reason" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:TextBox TextMode="MultiLine" Rows="3" Enabled="false" Columns="25" ID="txtReason" Text='<%#(Eval("MarketingReason").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Competitor" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustomerName" Text='<%#(Eval("MarketingCompetitor").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remark" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:TextBox TextMode="MultiLine" Rows="3" Enabled="false" Columns="25" ID="txtsalesremarks" Text='<%#(Eval("MarketingNotes").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>
                                           

                                        </Columns>

                                       <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                                <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                    </asp:GridView>
                                        </asp:Panel>

                                </div>
                            </div>
                            
                            <asp:Panel ID="pnlRevenue" runat="server" CssClass="pnlsubheading">
                                <div class="pull-left">
                                    <h5>
                                        <asp:Label ID="lbRevenueHead" runat="server" ForeColor="White" Font-Bold="true" Text="Revenue Details"></asp:Label>
                                    </h5>
                                </div>

                            </asp:Panel>

                             <div id="Div1" runat="server" style="overflow-y: auto; max-height: calc(100vh - 650px);overflow-x:hidden">


                                  <asp:GridView ID="gdvRevenue" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                        AllowSorting="True" EmptyDataText="No Data Found.." Width="100%" OnRowCommand="gdvRevenue_RowCommand" Font-Bold="false"
                                         class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>

                                            <asp:TemplateField HeaderText="Product Type" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblProduct" Text='<%#(Eval("ProductType").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" HorizontalAlign="center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Scope" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblScope" Text="" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Vendor List" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblVLStats" Text='<%#(Eval("VLStatus").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRevenueStatus" Text='<%#(Eval("RevenueStatus").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Sub Stage" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRSubStage" Text='<%#(Eval("SubStage").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                       

                                             <asp:TemplateField HeaderText="Lost Reason" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl1" Text='<%#(Eval("LostReason").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Competitor" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl2" Text='<%#(Eval("Competitor").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="8%" Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("SalesmanNotes").ToString()) %>' Visible="false"
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Lost Date" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl4" Text='<%#(Eval("LostDate").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Revenue Amount" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRevenueA" Text='<%#(Eval("RevenueAmount").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>
                                            
                                             <asp:TemplateField HeaderText="History" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnRevenueHistory" runat="server" CommandArgument='<%#(Eval("RevenueROWID").ToString()) %>' CommandName="History" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round"><i class="fa fa-history" title="History"></i></asp:LinkButton>

                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>
                                           

                                        </Columns>

                                       <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                                <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                    </asp:GridView>

                                 </div>
                            </div>



                            </div>
                        </asp:Panel>
             <div class="modal fade" id="MDSalesupdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content"  style="width: 200%;right:50%;" >
                                        <div class="modal-header">
                                            <h3 class="modal-title" id="H3">History</h3>
                                            <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                               
                                            </button>
                                        </div>
                                        <div class="modal-body">
                        
                                    <asp:Panel ID="Panel10" runat="server" Visible="true">


                                        <%-- Grid view history popup --%>
                                        <div id="dv5" style="overflow-y: auto; max-height: calc(100vh - 550px);overflow-x:hidden">
                                        <asp:GridView ID="gdvSalesupdateHistory" runat="server" overflow="scroll" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                            AllowSorting="True" EmptyDataText="No Data Found.."
                                           class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                            <Columns>

                                                <asp:TemplateField HeaderText="Overview" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblToOrgInvName" Text='<%#(Eval("Overview").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="8%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="15%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMEPContractor" Text='<%#(Eval("Remarks").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="WinPerc" ItemStyle-Width="5%" Visible="True">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCustomerName" Text='<%#(Eval("WinPerc").ToString()) %>' runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="5%" HorizontalAlign="Center" />
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblupdatedby" Text='<%#(Eval("Updatedby").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbldate" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                </asp:TemplateField>

                                            </Columns>


                                            <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                                <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                        </asp:GridView>

                                        
                                            </div>

                                    </asp:Panel>
                               

                    </div>
                                        </div>
                                    </div>
                 </div>
            

                    
              
                       
            <div class="modal fade" id="mpHistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content"  style="width: 200%;right:50%;" >
                                        <div class="modal-header">
                                            <h3 class="modal-title" id="H2">History</h3>
                                            <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                               
                                            </button>
                                        </div>
                                        <div class="modal-body">
            <div class="row">

                    
                     <div class="pull-left" style="width:50%">
                                        <asp:Panel ID="Panel12" runat="server" CssClass="pnlsubheading">
                                        <div class="pull-left">
                                            <h5>
                                                <asp:Label ID="Label12" class="panel-heading" Style="color: white;" runat="server" Text="Sales History"></asp:Label>
                                                    </h5>

                                        </div>
                                    </asp:Panel>
                                    <%-- Grid view Salesman History --%>
                                    <asp:Panel ID="Panel13" runat="server" BorderStyle="Solid" BorderWidth="1px">
                                         
                                    <asp:GridView ID="gdvSalesmanHistory" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                        AllowSorting="True" EmptyDataText="No Data Found.." AllowPaging="true"
                                       class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>

                                            <asp:TemplateField HeaderText="Over View" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl1" Height="10" Text='<%#(Eval("Overview").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                           
                                            <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl1" Height="10" Text='<%#(Eval("Remarks").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Win %" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl2" Text='<%#(Eval("Winperc").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%" />
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("UpdatedBy").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("Status").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>


                                          

                                        </Columns>

                                        
                                <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                                <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                    </asp:GridView>
                                           
                                        </asp:Panel>

                         </div>

                

                    

                                         <div class="pull-left" style="width:50%">
                                        <asp:Panel ID="Panel14" runat="server" CssClass="pnlsubheading">
                                        <div class="pull-left">
                                            <h5>
                                                <asp:Label ID="Label16" class="panel-heading" Style="color: white;" runat="server" Text="Sales Manager History"></asp:Label>
                                                    </h5>

                                        </div>
                                    </asp:Panel>
                                    <%-- Grid view Sales Manager History --%>
                                    <asp:Panel ID="Panel15" runat="server" BorderStyle="Solid" BorderWidth="1px">
                                         
                                    <asp:GridView ID="gdvSMHistory" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                        AllowSorting="True" EmptyDataText="No Data Found.." AllowPaging="true"
                                       class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>

                                              <asp:TemplateField HeaderText="Over View" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl1" Height="10" Text='<%#(Eval("Overview").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                           
                                            <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl1" Height="10" Text='<%#(Eval("Remarks").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Win %" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl2" Text='<%#(Eval("Winperc").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%" />
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("UpdatedBy").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("Status").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>


                                          

                                        </Columns>

                                        
                                <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                                <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                    </asp:GridView>
                                             
                                        </asp:Panel>

                         </div>
                </div>

                <div class="row">

                          <div class="pull-left" style="width:50%">
                                        <asp:Panel ID="Panel16" runat="server" CssClass="pnlsubheading">
                                        <div class="pull-left">
                                            <h5>
                                                <asp:Label ID="Label17" class="panel-heading" Style="color: white;" runat="server" Text="Marketing History"></asp:Label>
                                                    </h5>

                                        </div>
                                    </asp:Panel>
                                    <%-- Grid view Marketing History --%>
                                    <asp:Panel ID="Panel17" runat="server" BorderStyle="Solid" BorderWidth="1px">
                                        
                                    <asp:GridView ID="gdvMarketingHistory" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                        AllowSorting="True" EmptyDataText="No Data Found.." AllowPaging="true"
                                       class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>

                                            <asp:TemplateField HeaderText="Over View" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl1" Height="10" Text='<%#(Eval("Overview").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                           
                                            <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl1" Height="10" Text='<%#(Eval("Remarks").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Win %" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl2" Text='<%#(Eval("Winperc").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%" />
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("UpdateBy").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("Status").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                          

                                        </Columns>

                                        
                                <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                                <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                    </asp:GridView>
                                             
                                        </asp:Panel>

                         </div>

                         <div class="pull-left" style="width:50%">
                                        <asp:Panel ID="Panel8" runat="server" CssClass="pnlsubheading">
                                        <div class="pull-left">
                                            <h5>
                                                <asp:Label ID="Label11" class="panel-heading" Style="color: white;" runat="server" Text="Product Team History"></asp:Label>
                                                    </h5>

                                        </div>
                                    </asp:Panel>
                                    <%-- Grid view sales productTeam History --%>
                                    <asp:Panel ID="Panel11" runat="server" BorderStyle="Solid" BorderWidth="1px">
                                         
                                    <asp:GridView ID="gdvProductHistory" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                        AllowSorting="True" EmptyDataText="No Data Found.." AllowPaging="true"
                                       class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>

                                            <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl1" Height="10" Text='<%#(Eval("PTRemarks").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Conformation" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl5" Height="10" Text='<%#(Eval("PTConFormation").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Last Update" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl2" Text='<%#(Eval("PTLastUpdate").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Updated by" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl4" Text='<%#(Eval("Updatedby").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                          

                                        </Columns>

                                        
                                <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                                <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                    </asp:GridView>
                                            
                                        </asp:Panel>

                                         </div>


                        </div>


            </div>
               </div>
                                    </div>
                </div>
            </ContentTemplate>
                   </asp:UpdatePanel>
       </div>
    </div>
              
    </form>
</body>
</html>