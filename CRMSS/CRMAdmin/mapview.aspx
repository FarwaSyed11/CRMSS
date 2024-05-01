<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="mapview.aspx.cs" Inherits="CRMAdmin_mapview" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   
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
     height: 90vh; 
  }
}
@media screen and (min-width: 1900px) {
  #map {
     height: 90vh; 
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
     


<div  id='map' style="position: relative;outline: #f7f7f7;border: groove;"></div>
 <asp:Literal ID="ltrlMenu" runat="server" ></asp:Literal>
  
      
   
</asp:Content>

