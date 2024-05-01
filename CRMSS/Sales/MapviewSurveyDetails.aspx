<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MapviewSurveyDetails.aspx.cs" Inherits="Sales_MapviewSurveyDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

   
    <header>
        
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
         <script type="text/javascript">
             function onClick(e) {
   
                
                 

             }
             
    </script>
    </header>
    
 

<style>
    html, body {
        height: 100%;
        margin: 0;
        overflow-y: hidden;
      
        width :100%;
    }

  #map { height: 75vh; }

  

  @media screen and (min-width: 1400px) {
  #map {
    height: 70vh; 
  }
}
@media screen and (min-width: 1600px) {
  #map  {
     height: 70vh; 
  }
}
@media screen and (min-width: 1900px) {
  #map {
     height: 70vh; 
  }
}


  .marker-cluster-small {
background-color: rgba(124,252,0, 0.6) !important;
color:black !important;
font-style:oblique  !important;
}
.marker-cluster-small div {
background-color: rgba(124,252,0, 0.6) !important;
color:black !important;
font-style:oblique  !important;

}
.marker-cluster-medium {
background-color: rgba(124,252,0, 0.6) !important;
color:black !important;
font-style:oblique  !important;
}
.marker-cluster-medium div {
background-color: rgba(124,252,0, 0.6) !important;
color:black !important;
font-style:oblique  !important;
}

.marker-cluster-large {
background-color: rgba(124,252,0, 0.6) !important;
color:black !important;
font-style:oblique  !important;
}
.marker-cluster-large div {
background-color: rgba(124,252,0, 0.6) !important;
color:black !important;
font-style:oblique  !important;
}
    .leaflet-popup-content {
        margin: 13px 19px !important;
        line-height: 1.9 !important;
        font-weight: bold !important;
    }

                     .lnkbutton:hover {
    text-decoration: none;
    color: #f9f9f9 !important;
}

</style>
    <style>
.bg-info {
    background-color: #2b82cb !important;
}

.bg-success {
    background-color: #ffd326 !important;
}
.bg-warning {
    background-color: #cb293c !important;
}
.bg-danger {
    background-color: #31882A !important;
}
        .small-box .icon {
            right:50px !important;
        }
        .container-fluid {
            background-color: #8a96a1a6;;
            padding-top:15px;
            height:17vh;
        }
        /*.breadcrumb-customnew {
            text-align: center;
            font-family: 'Merriweather Sans', arial, verdana;
            display: inline-block;
            box-shadow: 0 0 15px 1px rgb(0 0 0 / 35%);
            border-radius: 5px;
        }


        .breadcrumb-custom a:first-child {
            padding-left: 20px !important;
        }

        .breadcrumb-custom a:before {
            content: none !important;
            counter-increment: none !important;
        }

        .small-box p {
            font-size: 19px !important;
            font-weight: bold !important;
        }*/

         .breadcrumb-customnew {
            text-align: center;
            font-family: 'Merriweather Sans', arial, verdana;
            display: inline-block;
            box-shadow: 0 0 15px 1px rgb(0 0 0 / 35%);
            border-radius: 5px;
        }


        .breadcrumb-custom a:first-child {
            padding-left: 20px !important;
        }

        .breadcrumb-custom a:before {
            content: none !important;
            counter-increment: none !important;
        }

        .small-box p {
            font-size: 19px !important;
            font-weight: bold !important;
        }

        .breadcrumb-custom a.active, .breadcrumb-custom a:hover {
            background: #333;
            background: linear-gradient(#333, #c03434);
        }
</style>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.1.0/dist/leaflet.css" integrity="sha512-wcw6ts8Anuw10Mzh9Ytw4pylW8+NAD4ch3lqm9lzAsTxg0GFeJgoAtxuCLREZSC5lUXdVyo/7yfsqFjQ4S+aKw==" crossorigin="" />
<script src="https://unpkg.com/leaflet@1.1.0/dist/leaflet.js" integrity="sha512-mNqn2Wg7tSToJhvHcqfzLMU6J4mkOImSPTxVZAdo+lcPlk+GhZmYgACEe0x35K7YzW1zJ7XyJV/TT1MrdXvMcA==" crossorigin=""></script>

<link rel="stylesheet" href="https://leaflet.github.io/Leaflet.markercluster/dist/MarkerCluster.css" />
<link rel="stylesheet" href="https://leaflet.github.io/Leaflet.markercluster/dist/MarkerCluster.Default.css" />
<script src="https://leaflet.github.io/Leaflet.markercluster/dist/leaflet.markercluster-src.js"></script>
     
            <div class="breadcrumb-custom" style="margin-left: 680px;">
                 <a id="aSiteSurvey" runat="server">
                      <asp:Button ID="btnSiteSurvey" runat="server" Text="SITE SURVEY" BackColor="Transparent" BorderStyle="None" OnClick="btnSiteSurvey_Click"/>
                 </a>
            </div>
        <div class="breadcrumb-custom">
                 <a id="aCRM" runat="server"> <asp:Button ID="btnCRM" runat="server" Text="CRM PROJECTS" BackColor="Transparent" BorderStyle="None" OnClick="btnCRM_Click"/></a>
            </div>
     <asp:Panel ID="pnlCRM" runat="server" >
     <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          
             <div class="col-lg-2 col-2">
                 <!-- small box -->
                 <div class="small-box bg-danger" >
                     <div class="inner">
                         <h3><asp:LinkButton ID="lblWonCount" CssClass="lnkbutton" Text="53" runat="server" OnClick="lblWonCount_Click" ForeColor="Black" ></asp:LinkButton> </h3>

                         <p>WON</p>
                     </div>
                     <div class="icon">
                        <img src="../Sales/Images/won.png" />
                     </div>
                     <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                 </div>
             </div>

           <div class="col-lg-2 col-2">
                 <!-- small box -->
                 <div class="small-box bg-warning">
                     <div class="inner">
                         <h3><asp:LinkButton ID="lblLostCount" CssClass="lnkbutton"  Text="65" runat="server" OnClick="lblLostCount_Click" ForeColor="Black" ></asp:LinkButton></h3>

                         <p>LOST</p>
                     </div>
                     <div class="icon">
                         <%--<i class="ion-clipboard"></i>--%>
                           <img src="../Sales/Images/lost.png" />
                     </div>
                     <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                 </div>
             </div>

             <div class="col-lg-2 col-2">
                 <!-- small box -->
                 <div class="small-box bg-info">
                     <div class="inner">
                         <h3><asp:LinkButton ID="lblWonJOH" CssClass="lnkbutton" Text="65" runat="server" OnClick="lblWonJOH_Click" ForeColor="Black" ></asp:LinkButton></h3>

                         <p>JOH</p>
                     </div>
                     <div class="icon">
                         <img src="../Sales/Images/joh.png" />
                     </div>
                     <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                 </div>
             </div>
              <div class="col-lg-2 col-2">
                 <!-- small box -->
                 <div class="small-box bg-success">
                     <div class="inner">
                         <h3><asp:LinkButton ID="lblTenderCount" CssClass="lnkbutton" Text="65" runat="server" OnClick="lblTenderCount_Click" ForeColor="Black" ></asp:LinkButton></h3>

                         <p>TENDER</p>
                     </div>
                     <div class="icon">
                        <img src="../Sales/Images/tender.png" />
                     </div>
                     <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                 </div>
             </div>
             <div class="col-lg-2 col-2">
                 <!-- small box -->
                 <div class="small-box bg-new">
                     <div class="inner">
                         <h3><asp:LinkButton ID="lblNewCount" CssClass="lnkbutton" Text="65" runat="server" OnClick="lblNewCount_Click" ForeColor="Black" ></asp:LinkButton></h3>

                         <p>NEW</p>
                     </div>
                     <div class="icon">
                         <img src="../Sales/Images/new.png" />
                     </div>
                     <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                 </div>
             </div>
             <div class="col-lg-2 col-2">
                 <!-- small box -->
                 <div class="small-box bg-current">
                     <div class="inner">
                         <h3><asp:LinkButton ID="lblCurrentYear" CssClass="lnkbutton" Text="65" runat="server" OnClick="lblCurrentYear_Click" ForeColor="Black" ></asp:LinkButton></h3>

                         <p>Current Year</p>
                     </div>
                     <div class="icon">
                       <img src="../Sales/Images/year2.png" />
                     </div>
                     <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                 </div>
             </div>
         </div>
		  </div>
         </asp:Panel>
    <asp:Panel ID="pnlSiteSurvey" runat="server" >
     <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          
             <div class="col-lg-2 col-2">
                 <!-- small box -->
                 <div class="small-box bg-danger" >
                     <div class="inner">
                         <h3><asp:LinkButton ID="lblTodaysVisit" CssClass="lnkbutton" Text="53" runat="server"  ForeColor="Black" OnClick="lblTodaysVisit_Click"></asp:LinkButton> </h3>

                         <p>Todays Visits</p>
                     </div>
                     <div class="icon">
                         <img src="../Sales/Images/todays.png" /> 
                     </div>
                     <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                 </div>
             </div>

           <div class="col-lg-2 col-2">
                 <!-- small box -->
                 <div class="small-box bg-warning">
                     <div class="inner">
                         <h3><asp:LinkButton ID="lblLastWeek" CssClass="lnkbutton" Text="65" runat="server"  ForeColor="Black" OnClick="lblLastWeek_Click"></asp:LinkButton></h3>

                         <p>Last Week</p>
                     </div>
                     <div class="icon">
                         <img src="../Sales/Images/week1.png" />
                     </div>
                     <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                 </div>
             </div>

             <div class="col-lg-2 col-2">
                 <!-- small box -->
                 <div class="small-box bg-info">
                     <div class="inner">
                         <h3><asp:LinkButton ID="lblThisMonth"  CssClass="lnkbutton" Text="65" runat="server"  ForeColor="Black" OnClick="lblThisMonth_Click"></asp:LinkButton></h3>

                         <p>This Month</p>
                     </div>
                     <div class="icon">
                         <img src="../Sales/Images/month.png" />
                     </div>
                     <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                 </div>
             </div>
              <div class="col-lg-2 col-2">
                 <!-- small box -->
                 <div class="small-box bg-success">
                     <div class="inner">
                         <h3><asp:LinkButton ID="lblNewProjectS" CssClass="lnkbutton" Text="65" runat="server"  ForeColor="Black" OnClick="lblNewProjectS_Click"></asp:LinkButton></h3>

                         <p>New Project</p>
                     </div>
                     <div class="icon">
                         <img src="../Sales/Images/neproject.png" />
                     </div>
                     <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                 </div>
             </div>
             <div class="col-lg-2 col-2">
                 <!-- small box -->
                 <div class="small-box bg-new">
                     <div class="inner">
                         <h3><asp:LinkButton ID="lblPlans" CssClass="lnkbutton" Text="65" runat="server"  ForeColor="Black"  OnClick="lblPlans_Click"></asp:LinkButton></h3>

                         <p>Plans</p>
                     </div>
                     <div class="icon">
                         <img src="../Sales/Images/plans.png" />
                     </div>
                     <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                 </div>
             </div>
            
         </div>
		  </div>
         </asp:Panel>

<div  id='map' style="position: relative;outline: #f7f7f7;border: groove;"></div>
 <asp:Literal ID="ltrlMenu" runat="server" ></asp:Literal>
  
      
   
</asp:Content>

