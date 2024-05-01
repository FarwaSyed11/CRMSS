using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sales_MapviewSurveyDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                aCRM.Attributes["Class"] = "";
                aSiteSurvey.Attributes["Class"] = "active";
                pnlSiteSurvey.Visible = true;
                pnlCRM.Visible = false;
                GetSummaryData();

                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();
                Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


                pa.Add("@Oper");
                pv.Add(9);



                DBHandler DBH = new DBHandler();
                DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

                //StringBuilder startupScript = new StringBuilder();
                //startupScript.Append(@"<script language=""Javascript"">");
                StringBuilder str = new StringBuilder();
                str.Append("<script> var map = L.map('map').setView([24.960961, 55.095784], 05);  L.tileLayer('http://{s}.google.com/vt?lyrs=m&x={x}&y={y}&z={z}', { maxZoom: 18,subdomains:['mt0','mt1','mt2','mt3'],attribution: '&copy; <a href= \"https://www.openstreetmap.org/copyright \" >OpenStreetMap</a> contributors'}).addTo(map);");
                // str.Append(" var LeafIcon = L.Icon.extend({options: { shadowUrl: 'leaf-shadow.png',iconSize: [38, 50],shadowSize: [50, 64],iconAnchor: [22, 94],shadowAnchor: [4, 62],popupAnchor: [-3, -76]} });");
                str.Append("var markerClusters = L.markerClusterGroup();");

                //str.Append("clusterOptions = markerClusterOptions(iconCreateFunction=JS(\"function (cluster) {var childCount = cluster.getChildCount();  if (childCount < 100) {  c = 'rgba(181, 226, 140, 1.0);'} else if (childCount < 1000) {  c = 'rgba(240, 194, 12, 1);'  } else { c = 'rgba(241, 128, 23, 1);'  }    return new L.DivIcon({ html: '<div style=\\\"background-color:'+c+'\\\"><span>' + childCount + '</span></div>', className: 'marker-cluster', iconSize: new L.Point(40, 40) });})");
                str.Append("var greenIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-green.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
                str.Append("var redIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
                str.Append("var goldIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-gold.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
                str.Append("var blueIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-blue.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
                str.Append("var orangeIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-orange.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {

                    str.Append("var title = " + ds.Tables[0].Rows[i][3] + ",id = " + ds.Tables[0].Rows[i][3] + ";");
                    //  str.Append("L.marker(" + ds.Tables[0].Rows[1][1] + ", " + ds.Tables[0].Rows[1][2] + "], { icon: greenIcon }).bindPopup(\"I am a green leaf.\").addTo(map);");
                    if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "LOST")
                        str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: redIcon });");

                    else if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "WON")
                        str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: greenIcon });");

                    else if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "OPEN")
                        str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: orangeIcon });");

                    else if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "JOH")
                        str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: blueIcon });");

                    else
                        str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: goldIcon });");


                    str.Append(" m.myID =  " + ds.Tables[0].Rows[i][3] + ";");

                    if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "JOH")
                        str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + ds.Tables[0].Rows[i]["PROJECTOWNER"] + " </br>" + ds.Tables[0].Rows[i]["MEPContractor"] + " </br>" + ds.Tables[0].Rows[i]["Win"] + " </br>" + "\").on('click', onClick);");
                    else
                        str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + "\").on('click', onClick);");
                    // str.Append("var marker= L.marker(new L.LatLng(" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "));");

                    // str.Append("markerClusters.addLayer(L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ title: title},13).bindPopup(\"" + ds.Tables[0].Rows[i][0] + "\").on('click', onClick));");
                    //  str.Append("L.DomEvent.addListener(marker.label, 'click', function(e) { this.togglePopup() }, marker);");
                    // str.Append("marker._leaflet_id = "+ ds.Tables[0].Rows[0][3] + ";");
                    str.Append("markerClusters.addLayer(m).addTo(map);");


                }
                //    startupScript.Append(@"</script>");
                ////    Page.ClientScript.RegisterStartupScript(this.GetType(), "onMapClick", startupScript.ToString());

                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "onMapClick", "onMapClick();", true);
                str.Append("map.addLayer(markerClusters);");

                //  str.Append("function onClick(e) {alert(this.getLatLng());}");

                str.Append("</script>");


                ltrlMenu.Text = str.ToString();

            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }
    protected void lblSurveyId_TextChanged(object sender, EventArgs e)
    {

    }
    protected void lblWonCount_Click(object sender, EventArgs e)
    {
        GetSummaryData();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(10);



        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

        //StringBuilder startupScript = new StringBuilder();
        //startupScript.Append(@"<script language=""Javascript"">");
        StringBuilder str = new StringBuilder();
        str.Append("<script> var map = L.map('map').setView([24.960961, 55.095784], 05);  L.tileLayer('http://{s}.google.com/vt?lyrs=m&x={x}&y={y}&z={z}', { maxZoom: 18,subdomains:['mt0','mt1','mt2','mt3'],attribution: '&copy; <a href= \"https://www.openstreetmap.org/copyright \" >OpenStreetMap</a> contributors'}).addTo(map);");
        // str.Append(" var LeafIcon = L.Icon.extend({options: { shadowUrl: 'leaf-shadow.png',iconSize: [38, 50],shadowSize: [50, 64],iconAnchor: [22, 94],shadowAnchor: [4, 62],popupAnchor: [-3, -76]} });");
        str.Append("var markerClusters = L.markerClusterGroup();");

        //str.Append("clusterOptions = markerClusterOptions(iconCreateFunction=JS(\"function (cluster) {var childCount = cluster.getChildCount();  if (childCount < 100) {  c = 'rgba(181, 226, 140, 1.0);'} else if (childCount < 1000) {  c = 'rgba(240, 194, 12, 1);'  } else { c = 'rgba(241, 128, 23, 1);'  }    return new L.DivIcon({ html: '<div style=\\\"background-color:'+c+'\\\"><span>' + childCount + '</span></div>', className: 'marker-cluster', iconSize: new L.Point(40, 40) });})");
        str.Append("var greenIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-green.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var redIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var goldIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-gold.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var blueIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-blue.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var orangeIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-orange.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {

            str.Append("var title = " + ds.Tables[0].Rows[i][3] + ",id = " + ds.Tables[0].Rows[i][3] + ";");
            //  str.Append("L.marker(" + ds.Tables[0].Rows[1][1] + ", " + ds.Tables[0].Rows[1][2] + "], { icon: greenIcon }).bindPopup(\"I am a green leaf.\").addTo(map);");
            if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "LOST")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: redIcon });");

            else if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "WON")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: greenIcon });");

            else if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "OPEN")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: orangeIcon });");

            else if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "JOH")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: blueIcon });");

            else
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: goldIcon });");


            str.Append(" m.myID =  " + ds.Tables[0].Rows[i][3] + ";");
            if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "JOH")
                str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + ds.Tables[0].Rows[i]["PROJECTOWNER"] + " </br>" + ds.Tables[0].Rows[i]["MEPContractor"] + " </br>" + ds.Tables[0].Rows[i]["Win"] + " </br>" + "\").on('click', onClick);");
            else
                str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + "\").on('click', onClick);");
            // str.Append("var marker= L.marker(new L.LatLng(" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "));");

            // str.Append("markerClusters.addLayer(L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ title: title},13).bindPopup(\"" + ds.Tables[0].Rows[i][0] + "\").on('click', onClick));");
            //  str.Append("L.DomEvent.addListener(marker.label, 'click', function(e) { this.togglePopup() }, marker);");
            // str.Append("marker._leaflet_id = "+ ds.Tables[0].Rows[0][3] + ";");
            str.Append("markerClusters.addLayer(m).addTo(map);");


        }
        //    startupScript.Append(@"</script>");
        ////    Page.ClientScript.RegisterStartupScript(this.GetType(), "onMapClick", startupScript.ToString());

        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "onMapClick", "onMapClick();", true);
        str.Append("map.addLayer(markerClusters);");

        //  str.Append("function onClick(e) {alert(this.getLatLng());}");

        str.Append("</script>");


        ltrlMenu.Text = str.ToString();

    }
    protected void lblLostCount_Click(object sender, EventArgs e)
    {
        GetSummaryData();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(11);



        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

        //StringBuilder startupScript = new StringBuilder();
        //startupScript.Append(@"<script language=""Javascript"">");
        StringBuilder str = new StringBuilder();
        str.Append("<script> var map = L.map('map').setView([24.960961, 55.095784], 05);  L.tileLayer('http://{s}.google.com/vt?lyrs=m&x={x}&y={y}&z={z}', { maxZoom: 18,subdomains:['mt0','mt1','mt2','mt3'],attribution: '&copy; <a href= \"https://www.openstreetmap.org/copyright \" >OpenStreetMap</a> contributors'}).addTo(map);");
        // str.Append(" var LeafIcon = L.Icon.extend({options: { shadowUrl: 'leaf-shadow.png',iconSize: [38, 50],shadowSize: [50, 64],iconAnchor: [22, 94],shadowAnchor: [4, 62],popupAnchor: [-3, -76]} });");
        str.Append("var markerClusters = L.markerClusterGroup();");

        //str.Append("clusterOptions = markerClusterOptions(iconCreateFunction=JS(\"function (cluster) {var childCount = cluster.getChildCount();  if (childCount < 100) {  c = 'rgba(181, 226, 140, 1.0);'} else if (childCount < 1000) {  c = 'rgba(240, 194, 12, 1);'  } else { c = 'rgba(241, 128, 23, 1);'  }    return new L.DivIcon({ html: '<div style=\\\"background-color:'+c+'\\\"><span>' + childCount + '</span></div>', className: 'marker-cluster', iconSize: new L.Point(40, 40) });})");
        str.Append("var greenIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-green.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var redIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var goldIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-gold.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var blueIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-blue.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var orangeIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-orange.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {

            str.Append("var title = " + ds.Tables[0].Rows[i][3] + ",id = " + ds.Tables[0].Rows[i][3] + ";");
            //  str.Append("L.marker(" + ds.Tables[0].Rows[1][1] + ", " + ds.Tables[0].Rows[1][2] + "], { icon: greenIcon }).bindPopup(\"I am a green leaf.\").addTo(map);");
            if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "LOST")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: redIcon });");

            else if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "WON")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: greenIcon });");

            else if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "OPEN")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: orangeIcon });");

            else if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "JOH")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: blueIcon });");

            else
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: goldIcon });");


            str.Append(" m.myID =  " + ds.Tables[0].Rows[i][3] + ";");
            if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "JOH")
                str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + ds.Tables[0].Rows[i]["PROJECTOWNER"] + " </br>" + ds.Tables[0].Rows[i]["MEPContractor"] + " </br>" + ds.Tables[0].Rows[i]["Win"] + " </br>" + "\").on('click', onClick);");
            else
                str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + "\").on('click', onClick);");
            // str.Append("var marker= L.marker(new L.LatLng(" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "));");

            // str.Append("markerClusters.addLayer(L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ title: title},13).bindPopup(\"" + ds.Tables[0].Rows[i][0] + "\").on('click', onClick));");
            //  str.Append("L.DomEvent.addListener(marker.label, 'click', function(e) { this.togglePopup() }, marker);");
            // str.Append("marker._leaflet_id = "+ ds.Tables[0].Rows[0][3] + ";");
            str.Append("markerClusters.addLayer(m).addTo(map);");


        }
        //    startupScript.Append(@"</script>");
        ////    Page.ClientScript.RegisterStartupScript(this.GetType(), "onMapClick", startupScript.ToString());

        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "onMapClick", "onMapClick();", true);
        str.Append("map.addLayer(markerClusters);");

        //  str.Append("function onClick(e) {alert(this.getLatLng());}");

        str.Append("</script>");


        ltrlMenu.Text = str.ToString();
    }
    protected void lblWonJOH_Click(object sender, EventArgs e)
    {
        GetSummaryData();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(12);



        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

        //StringBuilder startupScript = new StringBuilder();
        //startupScript.Append(@"<script language=""Javascript"">");
        StringBuilder str = new StringBuilder();
        str.Append("<script> var map = L.map('map').setView([24.960961, 55.095784], 05);  L.tileLayer('http://{s}.google.com/vt?lyrs=m&x={x}&y={y}&z={z}', { maxZoom: 18,subdomains:['mt0','mt1','mt2','mt3'],attribution: '&copy; <a href= \"https://www.openstreetmap.org/copyright \" >OpenStreetMap</a> contributors'}).addTo(map);");
        // str.Append(" var LeafIcon = L.Icon.extend({options: { shadowUrl: 'leaf-shadow.png',iconSize: [38, 50],shadowSize: [50, 64],iconAnchor: [22, 94],shadowAnchor: [4, 62],popupAnchor: [-3, -76]} });");
        str.Append("var markerClusters = L.markerClusterGroup();");

        //str.Append("clusterOptions = markerClusterOptions(iconCreateFunction=JS(\"function (cluster) {var childCount = cluster.getChildCount();  if (childCount < 100) {  c = 'rgba(181, 226, 140, 1.0);'} else if (childCount < 1000) {  c = 'rgba(240, 194, 12, 1);'  } else { c = 'rgba(241, 128, 23, 1);'  }    return new L.DivIcon({ html: '<div style=\\\"background-color:'+c+'\\\"><span>' + childCount + '</span></div>', className: 'marker-cluster', iconSize: new L.Point(40, 40) });})");
        str.Append("var greenIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-green.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var redIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var goldIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-gold.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var blueIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-blue.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var orangeIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-orange.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {

            str.Append("var title = " + ds.Tables[0].Rows[i][3] + ",id = " + ds.Tables[0].Rows[i][3] + ";");
            //  str.Append("L.marker(" + ds.Tables[0].Rows[1][1] + ", " + ds.Tables[0].Rows[1][2] + "], { icon: greenIcon }).bindPopup(\"I am a green leaf.\").addTo(map);");
            if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "JOH")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: blueIcon });");

            else
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: goldIcon });");


            str.Append(" m.myID =  " + ds.Tables[0].Rows[i][3] + ";");
            if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "JOH")
                str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + ds.Tables[0].Rows[i]["PROJECTOWNER"] + " </br>" + ds.Tables[0].Rows[i]["MEPContractor"] + " </br>" + ds.Tables[0].Rows[i]["Win"] + " </br>" + "\").on('click', onClick);");
            else
                str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + "\").on('click', onClick);");
            // str.Append("var marker= L.marker(new L.LatLng(" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "));");

            // str.Append("markerClusters.addLayer(L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ title: title},13).bindPopup(\"" + ds.Tables[0].Rows[i][0] + "\").on('click', onClick));");
            //  str.Append("L.DomEvent.addListener(marker.label, 'click', function(e) { this.togglePopup() }, marker);");
            // str.Append("marker._leaflet_id = "+ ds.Tables[0].Rows[0][3] + ";");
            str.Append("markerClusters.addLayer(m).addTo(map);");


        }
        //    startupScript.Append(@"</script>");
        ////    Page.ClientScript.RegisterStartupScript(this.GetType(), "onMapClick", startupScript.ToString());

        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "onMapClick", "onMapClick();", true);
        str.Append("map.addLayer(markerClusters);");

        //  str.Append("function onClick(e) {alert(this.getLatLng());}");

        str.Append("</script>");


        ltrlMenu.Text = str.ToString();
    }
    protected void lblTenderCount_Click(object sender, EventArgs e)
    {
        GetSummaryData();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(13);



        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

        //StringBuilder startupScript = new StringBuilder();
        //startupScript.Append(@"<script language=""Javascript"">");
        StringBuilder str = new StringBuilder();
        str.Append("<script> var map = L.map('map').setView([24.960961, 55.095784], 05);  L.tileLayer('http://{s}.google.com/vt?lyrs=m&x={x}&y={y}&z={z}', { maxZoom: 18,subdomains:['mt0','mt1','mt2','mt3'],attribution: '&copy; <a href= \"https://www.openstreetmap.org/copyright \" >OpenStreetMap</a> contributors'}).addTo(map);");
        // str.Append(" var LeafIcon = L.Icon.extend({options: { shadowUrl: 'leaf-shadow.png',iconSize: [38, 50],shadowSize: [50, 64],iconAnchor: [22, 94],shadowAnchor: [4, 62],popupAnchor: [-3, -76]} });");
        str.Append("var markerClusters = L.markerClusterGroup();");

        //str.Append("clusterOptions = markerClusterOptions(iconCreateFunction=JS(\"function (cluster) {var childCount = cluster.getChildCount();  if (childCount < 100) {  c = 'rgba(181, 226, 140, 1.0);'} else if (childCount < 1000) {  c = 'rgba(240, 194, 12, 1);'  } else { c = 'rgba(241, 128, 23, 1);'  }    return new L.DivIcon({ html: '<div style=\\\"background-color:'+c+'\\\"><span>' + childCount + '</span></div>', className: 'marker-cluster', iconSize: new L.Point(40, 40) });})");
        str.Append("var greenIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-green.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var redIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var goldIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-gold.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var blueIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-blue.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var orangeIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-orange.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {

            str.Append("var title = " + ds.Tables[0].Rows[i][3] + ",id = " + ds.Tables[0].Rows[i][3] + ";");
            //  str.Append("L.marker(" + ds.Tables[0].Rows[1][1] + ", " + ds.Tables[0].Rows[1][2] + "], { icon: greenIcon }).bindPopup(\"I am a green leaf.\").addTo(map);");
            if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "TENDER")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: blueIcon });");

            else
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: goldIcon });");


            str.Append(" m.myID =  " + ds.Tables[0].Rows[i][3] + ";");
            if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "JOH")
                str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + ds.Tables[0].Rows[i]["PROJECTOWNER"] + " </br>" + ds.Tables[0].Rows[i]["MEPContractor"] + " </br>" + ds.Tables[0].Rows[i]["Win"] + " </br>" + "\").on('click', onClick);");
            else
                str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + "\").on('click', onClick);");
            // str.Append("var marker= L.marker(new L.LatLng(" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "));");

            // str.Append("markerClusters.addLayer(L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ title: title},13).bindPopup(\"" + ds.Tables[0].Rows[i][0] + "\").on('click', onClick));");
            //  str.Append("L.DomEvent.addListener(marker.label, 'click', function(e) { this.togglePopup() }, marker);");
            // str.Append("marker._leaflet_id = "+ ds.Tables[0].Rows[0][3] + ";");
            str.Append("markerClusters.addLayer(m).addTo(map);");


        }
        //    startupScript.Append(@"</script>");
        ////    Page.ClientScript.RegisterStartupScript(this.GetType(), "onMapClick", startupScript.ToString());

        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "onMapClick", "onMapClick();", true);
        str.Append("map.addLayer(markerClusters);");

        //  str.Append("function onClick(e) {alert(this.getLatLng());}");

        str.Append("</script>");


        ltrlMenu.Text = str.ToString();
    }
    protected void lblNewCount_Click(object sender, EventArgs e)
    {
        GetSummaryData(); 
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(14);



        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

        //StringBuilder startupScript = new StringBuilder();
        //startupScript.Append(@"<script language=""Javascript"">");
        StringBuilder str = new StringBuilder();
        str.Append("<script> var map = L.map('map').setView([24.960961, 55.095784], 05);  L.tileLayer('http://{s}.google.com/vt?lyrs=m&x={x}&y={y}&z={z}', { maxZoom: 18,subdomains:['mt0','mt1','mt2','mt3'],attribution: '&copy; <a href= \"https://www.openstreetmap.org/copyright \" >OpenStreetMap</a> contributors'}).addTo(map);");
        // str.Append(" var LeafIcon = L.Icon.extend({options: { shadowUrl: 'leaf-shadow.png',iconSize: [38, 50],shadowSize: [50, 64],iconAnchor: [22, 94],shadowAnchor: [4, 62],popupAnchor: [-3, -76]} });");
        str.Append("var markerClusters = L.markerClusterGroup();");

        //str.Append("clusterOptions = markerClusterOptions(iconCreateFunction=JS(\"function (cluster) {var childCount = cluster.getChildCount();  if (childCount < 100) {  c = 'rgba(181, 226, 140, 1.0);'} else if (childCount < 1000) {  c = 'rgba(240, 194, 12, 1);'  } else { c = 'rgba(241, 128, 23, 1);'  }    return new L.DivIcon({ html: '<div style=\\\"background-color:'+c+'\\\"><span>' + childCount + '</span></div>', className: 'marker-cluster', iconSize: new L.Point(40, 40) });})");
        str.Append("var greenIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-green.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var redIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var goldIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-gold.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var blueIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-blue.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var orangeIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-orange.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {

            str.Append("var title = " + ds.Tables[0].Rows[i][3] + ",id = " + ds.Tables[0].Rows[i][3] + ";");
            //  str.Append("L.marker(" + ds.Tables[0].Rows[1][1] + ", " + ds.Tables[0].Rows[1][2] + "], { icon: greenIcon }).bindPopup(\"I am a green leaf.\").addTo(map);");
            if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "LOST")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: redIcon });");

            else if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "WON")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: greenIcon });");

            else if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "OPEN")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: orangeIcon });");

            else if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "JOH")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: blueIcon });");

            else
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: goldIcon });");


            str.Append(" m.myID =  " + ds.Tables[0].Rows[i][3] + ";");
            if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "JOH")
                str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + ds.Tables[0].Rows[i]["PROJECTOWNER"] + " </br>" + ds.Tables[0].Rows[i]["MEPContractor"] + " </br>" + ds.Tables[0].Rows[i]["Win"] + " </br>" + "\").on('click', onClick);");
            else
                str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + "\").on('click', onClick);");
            // str.Append("var marker= L.marker(new L.LatLng(" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "));");

            // str.Append("markerClusters.addLayer(L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ title: title},13).bindPopup(\"" + ds.Tables[0].Rows[i][0] + "\").on('click', onClick));");
            //  str.Append("L.DomEvent.addListener(marker.label, 'click', function(e) { this.togglePopup() }, marker);");
            // str.Append("marker._leaflet_id = "+ ds.Tables[0].Rows[0][3] + ";");
            str.Append("markerClusters.addLayer(m).addTo(map);");


        }
        //    startupScript.Append(@"</script>");
        ////    Page.ClientScript.RegisterStartupScript(this.GetType(), "onMapClick", startupScript.ToString());

        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "onMapClick", "onMapClick();", true);
        str.Append("map.addLayer(markerClusters);");

        //  str.Append("function onClick(e) {alert(this.getLatLng());}");

        str.Append("</script>");


        ltrlMenu.Text = str.ToString();
    }

    protected void lblCurrentYear_Click(object sender, EventArgs e)
    {
        GetSummaryData(); 
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(15);



        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

        //StringBuilder startupScript = new StringBuilder();
        //startupScript.Append(@"<script language=""Javascript"">");
        StringBuilder str = new StringBuilder();
        str.Append("<script> var map = L.map('map').setView([24.960961, 55.095784], 05);  L.tileLayer('http://{s}.google.com/vt?lyrs=m&x={x}&y={y}&z={z}', { maxZoom: 18,subdomains:['mt0','mt1','mt2','mt3'],attribution: '&copy; <a href= \"https://www.openstreetmap.org/copyright \" >OpenStreetMap</a> contributors'}).addTo(map);");
        // str.Append(" var LeafIcon = L.Icon.extend({options: { shadowUrl: 'leaf-shadow.png',iconSize: [38, 50],shadowSize: [50, 64],iconAnchor: [22, 94],shadowAnchor: [4, 62],popupAnchor: [-3, -76]} });");
        str.Append("var markerClusters = L.markerClusterGroup();");

        //str.Append("clusterOptions = markerClusterOptions(iconCreateFunction=JS(\"function (cluster) {var childCount = cluster.getChildCount();  if (childCount < 100) {  c = 'rgba(181, 226, 140, 1.0);'} else if (childCount < 1000) {  c = 'rgba(240, 194, 12, 1);'  } else { c = 'rgba(241, 128, 23, 1);'  }    return new L.DivIcon({ html: '<div style=\\\"background-color:'+c+'\\\"><span>' + childCount + '</span></div>', className: 'marker-cluster', iconSize: new L.Point(40, 40) });})");
        str.Append("var greenIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-green.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var redIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var goldIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-gold.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var blueIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-blue.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var orangeIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-orange.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var Current = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-black.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");


        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {

            str.Append("var title = " + ds.Tables[0].Rows[i][3] + ",id = " + ds.Tables[0].Rows[i][3] + ";");
            //  str.Append("L.marker(" + ds.Tables[0].Rows[1][1] + ", " + ds.Tables[0].Rows[1][2] + "], { icon: greenIcon }).bindPopup(\"I am a green leaf.\").addTo(map);");
            if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "LOST")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: redIcon });");

            else if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "WON")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: greenIcon });");

            else if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "OPEN")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: orangeIcon });");

            else if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "JOH")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: blueIcon });");

            else
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: goldIcon });");


            str.Append(" m.myID =  " + ds.Tables[0].Rows[i][3] + ";");


            if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "JOH")
                str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + ds.Tables[0].Rows[i]["PROJECTOWNER"] + " </br>" + ds.Tables[0].Rows[i]["MEPContractor"] + " </br>" + ds.Tables[0].Rows[i]["Win"] + " </br>" + "\").on('click', onClick);");
            else
                str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + "\").on('click', onClick);");
            // str.Append("var marker= L.marker(new L.LatLng(" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "));");

            // str.Append("markerClusters.addLayer(L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ title: title},13).bindPopup(\"" + ds.Tables[0].Rows[i][0] + "\").on('click', onClick));");
            //  str.Append("L.DomEvent.addListener(marker.label, 'click', function(e) { this.togglePopup() }, marker);");
            // str.Append("marker._leaflet_id = "+ ds.Tables[0].Rows[0][3] + ";");
            str.Append("markerClusters.addLayer(m).addTo(map);");


        }
        //    startupScript.Append(@"</script>");
        ////    Page.ClientScript.RegisterStartupScript(this.GetType(), "onMapClick", startupScript.ToString());

        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "onMapClick", "onMapClick();", true);
        str.Append("map.addLayer(markerClusters);");

        //  str.Append("function onClick(e) {alert(this.getLatLng());}");

        str.Append("</script>");


        ltrlMenu.Text = str.ToString();
    }
    protected void btnSiteSurvey_Click(object sender, EventArgs e)
    {
        aCRM.Attributes["Class"] = "";
        aSiteSurvey.Attributes["Class"] = "active";
        pnlSiteSurvey.Visible = true;
        pnlCRM.Visible = false;
        GetSummaryData(); 


        pnlSiteSurvey.Visible = true;
        pnlCRM.Visible = false;
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(9);



        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

        //StringBuilder startupScript = new StringBuilder();
        //startupScript.Append(@"<script language=""Javascript"">");
        StringBuilder str = new StringBuilder();
        str.Append("<script> var map = L.map('map').setView([24.960961, 55.095784], 05);  L.tileLayer('http://{s}.google.com/vt?lyrs=m&x={x}&y={y}&z={z}', { maxZoom: 18,subdomains:['mt0','mt1','mt2','mt3'],attribution: '&copy; <a href= \"https://www.openstreetmap.org/copyright \" >OpenStreetMap</a> contributors'}).addTo(map);");
        // str.Append(" var LeafIcon = L.Icon.extend({options: { shadowUrl: 'leaf-shadow.png',iconSize: [38, 50],shadowSize: [50, 64],iconAnchor: [22, 94],shadowAnchor: [4, 62],popupAnchor: [-3, -76]} });");
        str.Append("var markerClusters = L.markerClusterGroup();");

        //str.Append("clusterOptions = markerClusterOptions(iconCreateFunction=JS(\"function (cluster) {var childCount = cluster.getChildCount();  if (childCount < 100) {  c = 'rgba(181, 226, 140, 1.0);'} else if (childCount < 1000) {  c = 'rgba(240, 194, 12, 1);'  } else { c = 'rgba(241, 128, 23, 1);'  }    return new L.DivIcon({ html: '<div style=\\\"background-color:'+c+'\\\"><span>' + childCount + '</span></div>', className: 'marker-cluster', iconSize: new L.Point(40, 40) });})");
        str.Append("var greenIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-green.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var redIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var goldIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-gold.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var blueIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-blue.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var orangeIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-orange.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {

            str.Append("var title = " + ds.Tables[0].Rows[i][3] + ",id = " + ds.Tables[0].Rows[i][3] + ";");
            //  str.Append("L.marker(" + ds.Tables[0].Rows[1][1] + ", " + ds.Tables[0].Rows[1][2] + "], { icon: greenIcon }).bindPopup(\"I am a green leaf.\").addTo(map);");
            if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "LOST")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: redIcon });");

            else if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "WON")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: greenIcon });");

            else if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "OPEN")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: orangeIcon });");

            else if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "JOH")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: blueIcon });");

            else
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: goldIcon });");


            str.Append(" m.myID =  " + ds.Tables[0].Rows[i][3] + ";");

            if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "JOH")
                str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + ds.Tables[0].Rows[i]["PROJECTOWNER"] + " </br>" + ds.Tables[0].Rows[i]["MEPContractor"] + " </br>" + ds.Tables[0].Rows[i]["Win"] + " </br>" + "\").on('click', onClick);");
            else
                str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + "\").on('click', onClick);");
            // str.Append("var marker= L.marker(new L.LatLng(" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "));");

            // str.Append("markerClusters.addLayer(L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ title: title},13).bindPopup(\"" + ds.Tables[0].Rows[i][0] + "\").on('click', onClick));");
            //  str.Append("L.DomEvent.addListener(marker.label, 'click', function(e) { this.togglePopup() }, marker);");
            // str.Append("marker._leaflet_id = "+ ds.Tables[0].Rows[0][3] + ";");
            str.Append("markerClusters.addLayer(m).addTo(map);");


        }
        //    startupScript.Append(@"</script>");
        ////    Page.ClientScript.RegisterStartupScript(this.GetType(), "onMapClick", startupScript.ToString());

        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "onMapClick", "onMapClick();", true);
        str.Append("map.addLayer(markerClusters);");

        //  str.Append("function onClick(e) {alert(this.getLatLng());}");

        str.Append("</script>");


        ltrlMenu.Text = str.ToString();


    }
    protected void btnCRM_Click(object sender, EventArgs e)
    {




        GetSummaryData(); 
        aCRM.Attributes["Class"] = "active";
        aSiteSurvey.Attributes["Class"] = "";
        pnlSiteSurvey.Visible = false;
        pnlCRM.Visible = true;


        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(16);



        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

        //StringBuilder startupScript = new StringBuilder();
        //startupScript.Append(@"<script language=""Javascript"">");
        StringBuilder str = new StringBuilder();
        str.Append("<script> var map = L.map('map').setView([24.960961, 55.095784], 05);  L.tileLayer('http://{s}.google.com/vt?lyrs=m&x={x}&y={y}&z={z}', { maxZoom: 18,subdomains:['mt0','mt1','mt2','mt3'],attribution: '&copy; <a href= \"https://www.openstreetmap.org/copyright \" >OpenStreetMap</a> contributors'}).addTo(map);");
        // str.Append(" var LeafIcon = L.Icon.extend({options: { shadowUrl: 'leaf-shadow.png',iconSize: [38, 50],shadowSize: [50, 64],iconAnchor: [22, 94],shadowAnchor: [4, 62],popupAnchor: [-3, -76]} });");
        str.Append("var markerClusters = L.markerClusterGroup();");

        //str.Append("clusterOptions = markerClusterOptions(iconCreateFunction=JS(\"function (cluster) {var childCount = cluster.getChildCount();  if (childCount < 100) {  c = 'rgba(181, 226, 140, 1.0);'} else if (childCount < 1000) {  c = 'rgba(240, 194, 12, 1);'  } else { c = 'rgba(241, 128, 23, 1);'  }    return new L.DivIcon({ html: '<div style=\\\"background-color:'+c+'\\\"><span>' + childCount + '</span></div>', className: 'marker-cluster', iconSize: new L.Point(40, 40) });})");
        str.Append("var greenIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-green.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var redIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var goldIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-gold.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var blueIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-blue.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var orangeIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-orange.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {

            str.Append("var title = " + ds.Tables[0].Rows[i][3] + ",id = " + ds.Tables[0].Rows[i][3] + ";");
            //  str.Append("L.marker(" + ds.Tables[0].Rows[1][1] + ", " + ds.Tables[0].Rows[1][2] + "], { icon: greenIcon }).bindPopup(\"I am a green leaf.\").addTo(map);");
            if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "LOST")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: redIcon });");

            else if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "WON")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: greenIcon });");

            else if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "OPEN")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: orangeIcon });");

            else if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "JOH")
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: blueIcon });");

            else
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: goldIcon });");


            str.Append(" m.myID =  " + ds.Tables[0].Rows[i][3] + ";");

            if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "JOH")
                str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + ds.Tables[0].Rows[i]["PROJECTOWNER"] + " </br>" + ds.Tables[0].Rows[i]["MEPContractor"] + " </br>" + ds.Tables[0].Rows[i]["Win"] + " </br>" + "\").on('click', onClick);");
            else
                str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + "\").on('click', onClick);");
            // str.Append("var marker= L.marker(new L.LatLng(" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "));");

            // str.Append("markerClusters.addLayer(L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ title: title},13).bindPopup(\"" + ds.Tables[0].Rows[i][0] + "\").on('click', onClick));");
            //  str.Append("L.DomEvent.addListener(marker.label, 'click', function(e) { this.togglePopup() }, marker);");
            // str.Append("marker._leaflet_id = "+ ds.Tables[0].Rows[0][3] + ";");
            str.Append("markerClusters.addLayer(m).addTo(map);");


        }
        //    startupScript.Append(@"</script>");
        ////    Page.ClientScript.RegisterStartupScript(this.GetType(), "onMapClick", startupScript.ToString());

        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "onMapClick", "onMapClick();", true);
        str.Append("map.addLayer(markerClusters);");

        //  str.Append("function onClick(e) {alert(this.getLatLng());}");

        str.Append("</script>");


        ltrlMenu.Text = str.ToString();



    }
    public void GetSummaryData()
    {
        try
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


            pa.Add("@Oper");
            pv.Add(17);



            DBHandler DBH = new DBHandler();
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

            lblWonCount.Text = ds.Tables[0].Rows[0]["WON"].ToString();
            lblLostCount.Text = ds.Tables[0].Rows[0]["LOST"].ToString();
            lblWonJOH.Text = ds.Tables[0].Rows[0]["JOH"].ToString();
            lblTenderCount.Text = ds.Tables[0].Rows[0]["TENDER"].ToString();
            lblNewCount.Text = ds.Tables[0].Rows[0]["NEW"].ToString();
            lblCurrentYear.Text = ds.Tables[0].Rows[0]["CurrentYear"].ToString();


            lblTodaysVisit.Text = ds.Tables[1].Rows[0]["Today"].ToString();
            lblLastWeek.Text = ds.Tables[1].Rows[0]["LASTWEEK"].ToString();
            lblThisMonth.Text = ds.Tables[1].Rows[0]["THISMONTH"].ToString();
            lblNewProjectS.Text = ds.Tables[1].Rows[0]["NEWPROJECT"].ToString();


            lblPlans.Text = ds.Tables[2].Rows[0][0].ToString();

        }
        catch (Exception s)
        { }
    }
    public void SiteSurveyData(int _oper)
    {
        try
        {
            GetSummaryData();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


            pa.Add("@Oper");
            pv.Add(_oper);


            DBHandler DBH = new DBHandler();
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

            StringBuilder str = new StringBuilder();
            str.Append("<script> var map = L.map('map').setView([24.960961, 55.095784], 05);  L.tileLayer('http://{s}.google.com/vt?lyrs=m&x={x}&y={y}&z={z}', { maxZoom: 18,subdomains:['mt0','mt1','mt2','mt3'],attribution: '&copy; <a href= \"https://www.openstreetmap.org/copyright \" >OpenStreetMap</a> contributors'}).addTo(map);");
            // str.Append(" var LeafIcon = L.Icon.extend({options: { shadowUrl: 'leaf-shadow.png',iconSize: [38, 50],shadowSize: [50, 64],iconAnchor: [22, 94],shadowAnchor: [4, 62],popupAnchor: [-3, -76]} });");
            str.Append("var markerClusters = L.markerClusterGroup();");

            //str.Append("clusterOptions = markerClusterOptions(iconCreateFunction=JS(\"function (cluster) {var childCount = cluster.getChildCount();  if (childCount < 100) {  c = 'rgba(181, 226, 140, 1.0);'} else if (childCount < 1000) {  c = 'rgba(240, 194, 12, 1);'  } else { c = 'rgba(241, 128, 23, 1);'  }    return new L.DivIcon({ html: '<div style=\\\"background-color:'+c+'\\\"><span>' + childCount + '</span></div>', className: 'marker-cluster', iconSize: new L.Point(40, 40) });})");
            str.Append("var greenIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-green.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
            str.Append("var redIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
            str.Append("var goldIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-gold.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
            str.Append("var blueIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-blue.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
            str.Append("var orangeIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-orange.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {

                str.Append("var title = " + ds.Tables[0].Rows[i][3] + ",id = " + ds.Tables[0].Rows[i][3] + ";");
                //  str.Append("L.marker(" + ds.Tables[0].Rows[1][1] + ", " + ds.Tables[0].Rows[1][2] + "], { icon: greenIcon }).bindPopup(\"I am a green leaf.\").addTo(map);");
                if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "LOST")
                    str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: redIcon });");

                else if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "WON")
                    str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: greenIcon });");

                else if (ds.Tables[0].Rows[i]["Status"].ToString().Trim() == "OPEN")
                    str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: orangeIcon });");

                else if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "JOH")
                    str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: blueIcon });");

                else
                    str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ icon: goldIcon });");


                str.Append(" m.myID =  " + ds.Tables[0].Rows[i][3] + ";");

                if (ds.Tables[0].Rows[i]["Stage"].ToString().Trim() == "JOH")
                    str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + ds.Tables[0].Rows[i]["PROJECTOWNER"] + " </br>" + ds.Tables[0].Rows[i]["MEPContractor"] + " </br>" + ds.Tables[0].Rows[i]["Win"] + " </br>" + "\").on('click', onClick);");
                else
                    str.Append("m.bindPopup(\"" + ds.Tables[0].Rows[i]["ProjectNumber"] + "</br>" + ds.Tables[0].Rows[i]["ProjectName"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStatus"] + " </br>" + ds.Tables[0].Rows[i]["ProjectType"] + " </br>" + ds.Tables[0].Rows[i]["ProjectStage"] + " </br>" + ds.Tables[0].Rows[i]["ProjectClient"] + " </br>" + ds.Tables[0].Rows[i]["MEPConsultant"] + " </br>" + ds.Tables[0].Rows[i]["MainContractorName"] + " </br>" + "\").on('click', onClick);");
                // str.Append("var marker= L.marker(new L.LatLng(" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "));");

                // str.Append("markerClusters.addLayer(L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ title: title},13).bindPopup(\"" + ds.Tables[0].Rows[i][0] + "\").on('click', onClick));");
                //  str.Append("L.DomEvent.addListener(marker.label, 'click', function(e) { this.togglePopup() }, marker);");
                // str.Append("marker._leaflet_id = "+ ds.Tables[0].Rows[0][3] + ";");
                str.Append("markerClusters.addLayer(m).addTo(map);");


            }
            //    startupScript.Append(@"</script>");
            ////    Page.ClientScript.RegisterStartupScript(this.GetType(), "onMapClick", startupScript.ToString());

            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "onMapClick", "onMapClick();", true);
            str.Append("map.addLayer(markerClusters);");

            //  str.Append("function onClick(e) {alert(this.getLatLng());}");

            str.Append("</script>");


            ltrlMenu.Text = str.ToString();

        }
        catch(Exception s)
        { }
    }
    protected void lblTodaysVisit_Click(object sender, EventArgs e)
    {
        SiteSurveyData(18);
    }
    protected void lblLastWeek_Click(object sender, EventArgs e)
    {
        SiteSurveyData(19);
    }
    protected void lblThisMonth_Click(object sender, EventArgs e)
    {
        SiteSurveyData(20);
    }
    protected void lblNewProjectS_Click(object sender, EventArgs e)
    {
        SiteSurveyData(21);
    }
    protected void lblPlans_Click(object sender, EventArgs e)
    {
       // GetSummaryData();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(22);


        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

        StringBuilder str = new StringBuilder();
        str.Append("<script> var map = L.map('map').setView([24.960961, 55.095784], 05);  L.tileLayer('http://{s}.google.com/vt?lyrs=m&x={x}&y={y}&z={z}', { maxZoom: 18,subdomains:['mt0','mt1','mt2','mt3'],attribution: '&copy; <a href= \"https://www.openstreetmap.org/copyright \" >OpenStreetMap</a> contributors'}).addTo(map);");
        // str.Append(" var LeafIcon = L.Icon.extend({options: { shadowUrl: 'leaf-shadow.png',iconSize: [38, 50],shadowSize: [50, 64],iconAnchor: [22, 94],shadowAnchor: [4, 62],popupAnchor: [-3, -76]} });");
        str.Append("var markerClusters = L.markerClusterGroup();");

        //str.Append("clusterOptions = markerClusterOptions(iconCreateFunction=JS(\"function (cluster) {var childCount = cluster.getChildCount();  if (childCount < 100) {  c = 'rgba(181, 226, 140, 1.0);'} else if (childCount < 1000) {  c = 'rgba(240, 194, 12, 1);'  } else { c = 'rgba(241, 128, 23, 1);'  }    return new L.DivIcon({ html: '<div style=\\\"background-color:'+c+'\\\"><span>' + childCount + '</span></div>', className: 'marker-cluster', iconSize: new L.Point(40, 40) });})");
        str.Append("var greenIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-green.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var redIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var goldIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-gold.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var blueIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-blue.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");
        str.Append("var orangeIcon = new L.Icon({iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-orange.png',shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',iconSize: [25, 41],iconAnchor: [12, 41],popupAnchor: [1, -34],shadowSize: [41, 41]});");

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {

            //str.Append("var title = " + ds.Tables[0].Rows[i][1] + ",id = " + ds.Tables[0].Rows[i][0] + ";");
            //  str.Append("L.marker(" + ds.Tables[0].Rows[1][1] + ", " + ds.Tables[0].Rows[1][2] + "], { icon: greenIcon }).bindPopup(\"I am a green leaf.\").addTo(map);");
            
                str.Append("var m= L.marker([" + ds.Tables[0].Rows[i][2] + ", " + ds.Tables[0].Rows[i][3] + "],{ icon: blueIcon });");

       

            str.Append(" m.myID =  " + ds.Tables[0].Rows[i][0] + ";");

            str.Append("m.bindPopup(\" " + ds.Tables[0].Rows[i]["AreaName"] + "</br>  Plan for Visit :" + ds.Tables[0].Rows[i]["FromDate"] + " </br> Expect Finish On :" + ds.Tables[0].Rows[i]["ToDate"] + " </br> Status : <b>" + ds.Tables[0].Rows[i]["Status"] + "<b> </br>" + "\").on('click', onClick);");
            // str.Append("var marker= L.marker(new L.LatLng(" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "));");

            str.Append("var circle = L.circle([" + ds.Tables[0].Rows[i][2] + ", " + ds.Tables[0].Rows[i][3] + "], {color: 'red',fillColor: '#f03',fillOpacity: 0.5,radius: " + ds.Tables[0].Rows[i]["Radius"] + "}).addTo(map);");

            // str.Append("markerClusters.addLayer(L.marker([" + ds.Tables[0].Rows[i][1] + ", " + ds.Tables[0].Rows[i][2] + "],{ title: title},13).bindPopup(\"" + ds.Tables[0].Rows[i][0] + "\").on('click', onClick));");
            //  str.Append("L.DomEvent.addListener(marker.label, 'click', function(e) { this.togglePopup() }, marker);");
            // str.Append("marker._leaflet_id = "+ ds.Tables[0].Rows[0][3] + ";");
            str.Append("markerClusters.addLayer(m).addTo(map);");


        }
        //    startupScript.Append(@"</script>");
        ////    Page.ClientScript.RegisterStartupScript(this.GetType(), "onMapClick", startupScript.ToString());

        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "onMapClick", "onMapClick();", true);
       str.Append("map.addLayer(markerClusters);");

        //  str.Append("function onClick(e) {alert(this.getLatLng());}");

        str.Append("</script>");


        ltrlMenu.Text = str.ToString();
    }
}