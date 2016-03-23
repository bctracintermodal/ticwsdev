/****************************************
*** jQueryMaps Map Management Library ***
****************************************/

	if (window.location.href.indexOf('jqmdebug') != -1)
		document.write("<script src='http://localhost/jqm/jquerymaps/libs/jquerymaps/JQueryMaps_debug.js'><\/script>");
	else
		document.write("<script src='jquerymaps/libs/jquerymaps/JQueryMaps.js'><\/script>");

	/* VARIABLES */
	var jqmMap;
	var jqmMapInitial = "";
	var map_zoom = 14;
	var map_popup = new google.maps.InfoWindow();

	$(document).ready(function() {
		$("#jqm-dialog").dialog({autoOpen: false});	
		
		jqmMapInitial = getURLParameter("r");
		jqmLoadMap();
	});
	
	$(window).resize( function() { jqmResize(); });
	$(window).bind("orientationchange", function(event) { jqmResize(); });
	
	/*** JQM - RESIZE ***/
	function jqmResize() {
		jqmMap.changeViewportSize({width: $(".box-map").width(), height: $(".box-map").height()});
	}

	function jqmLoadMap() {
		var theme = "jquerymaps/theme/us.php";
		var params = {mapDivId: "jqmMap", configUrl: "jquerymaps/jqm_config.xml", initialThemeUrl: theme, width: $(".box-map").width(), height: $(".box-map").height()};
		jqmMap = new JQueryMaps.Map(params);
	}

	function jqmFromMap(obj) { 

		var f = jqmMap.getClickedFeatures();
		if (f.length == 0 && obj.event == "buttonClicked") { jqmSetRegionMarkers(""); }
	}
	
	function jqmSetRegion(id) {
		if ($(".box-google").is(":visible")) { $(".box-map").show(); $(".box-google").hide(); }
		jqmMap.clickOnFeature("region_" + id); 
		jqmSetRegionMarkers(id);
	}
	
	function jqmSetRegionMap(obj) { jqmSetRegionMarkers(obj.id.substr(7)); }
	
	function jqmSetRegionMarkers(id) {

//		jqmMap.hideMarkersByCategory("*"); 
		jqmMap.removeMarkers();

		if (id != "") {
//			jqmMap.showMarkersByCategory("location_" + id); 
			jqmMap.loadMarkers("jquerymaps/theme/marker_states.php?r=" + id); 
		} else {
			jqmMap.loadMarkers("jquerymaps/theme/marker_states.php"); 
		}
		
//		jqmMap.refreshMarkers();
	}
	
	function jqmDisplayMarkerPopup(obj) {
		jqmDisplayPopup(obj.id);
	}
	
	function jqmDisplayPopup(id) {
		$.ajax({url: "jquerymaps/data/location.php", data: "id=" + id, cache: false, success: function(data) {
			$("#jqm-dialog").html(data);
			//$("#jqm-dialog").dialog({autoOpen: true, draggable: false, width: 800, resizable: false, title: " "});
			$("#jqm-dialog").dialog({autoOpen: true, draggable: false, width: 800, resizable: false, title: " ", position: { of: "#jqmMap" } });
		} });
	}
	
	function jqmDisplayGoogle(id, lat, lon) {
		
		$("#jqm-dialog").dialog({ autoOpen: false }).dialog("close");  
		
		$(".box-map").hide();
		$(".box-google").show();
		
		var mapOptions = { center: new google.maps.LatLng(lat, lon), zoom: 15, mapTypeId: google.maps.MapTypeId.ROADMAP, mapTypeControl: true, panControl: true, streetViewControl: true, scaleControl: true,
								zoomControl: true,zoomControlOptions: {position: google.maps.ControlPosition.RIGHT_TOP}};
		map = new google.maps.Map(document.getElementById("google"), mapOptions);			
		map_popup =  new google.maps.InfoWindow({content: ''});

		
		$.ajax({url: "jquerymaps/data/location_google.php", data: "id=" + id, dataType: "json", cache: false, success: function(data) {
			
			var list = $.parseJSON(JSON.stringify(data));
			var bounds = new google.maps.LatLngBounds();

		    $.each(list, function (index, item) {
				var marker = new google.maps.Marker({position: new google.maps.LatLng(item.lat, item.lon), map: map, title: item.location});
				//marker.setTitle("<div class=\"tooltip\">" + item.location.toUpperCase() + "<br />" + item.address + "<br />" + item.city + ", " + item.state + "</div>");
				marker.setTitle(item.location.toUpperCase() + "<br />" + item.address + "<br />" + item.city + ", " + item.state);
				bounds.extend(new google.maps.LatLng(item.lat, item.lon));

				//alert(item.location.toUpperCase() + "<br />" + item.address + "<br />" + item.city + ", " + item.state);
				
				google.maps.event.addListener(marker, 'mouseover', function() { map_popup.setContent(marker.title + " tacked on to the address!"); map_popup.open(map, this ); });
				google.maps.event.addListener(marker, 'mouseout', function() { map_popup.close(); });
		    });
			
			map.fitBounds(bounds);
			if (map.getZoom() > map_zoom) { map.setZoom(map_zoom); }
		} });
	}
	
	function jqmDisplayPopupClose() {
		$(".box-map").show();
		$(".box-google").hide();
	}

	function getURLParameter(name) {
    	return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||"";
	}