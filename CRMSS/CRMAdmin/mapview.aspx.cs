using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMAdmin_mapview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
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
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
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