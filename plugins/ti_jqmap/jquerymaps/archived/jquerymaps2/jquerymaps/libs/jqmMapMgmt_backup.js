
/*
jQueryMaps Map Management Library

This file contains everything directed related to the map:
- The reference to the jQueryMaps library.
- The JQueryMaps class instancing when the page is loaded.infowindow
- The functions that interact with the map.

Call 1-866-392-0071 or email us at support@flashmaps.com for support.
*/

// Load the jQueryMaps library
if (window.location.href.indexOf('jqmdebug') != -1)
	// Load the debug version of the jQueryMaps library if '?jqmdebug' is added to the URL
	// This lets our technicians help you if anything doesn't work as expected
	document.write("<script src='http://localhost/jqm/jquerymaps/libs/jquerymaps/JQueryMaps_debug.js'><\/script>");
else
	// Load the standard jQueryMaps library
	document.write("<script src='jquerymaps/libs/jquerymaps/JQueryMaps.js'><\/script>");
	
	// jqmMap is the map instance
	var jqmMap;
	
	var ytbplayer;

	// Miscelaneaus variables
	var jqmMapYear = "2010";

	// Actions to run when the document has been loaded
	$(document).ready(function() {
		// Initialize some project-related things
		$('#slider').slider({orientation: 'horizontal', min: 1970, max: 2010, step: 10, range: 'min', value: 2010, change: function(event, ui) { jqmSetYear(ui.value); }  });
		$("#jqm_dialog").dialog({autoOpen: false});	
		
		// Load the map
		jqmLoadMap();

	});


		
	
// Load the map
function jqmLoadMap() {	

	var theme = "jquerymaps/theme/" + jqmMapYear + "/us.xml";

	// Set the parameters to create the map
	var params = {mapDivId: "jqm_map", 				// The DIV element that will contain the map
		configUrl: "jquerymaps/jqm_config.xml", 	// The general configuration URL
		initialThemeUrl: theme, 					// The initial theme URL (children themes may be loaded later on)
		width: "1000", 								// Map width
		height: "900"}; 							// Map height

	// Create the map by instancing the JQueryMaps.Map class
	jqmMap = new JQueryMaps.Map(params);

}

// Called from the map on system events
function jqmFromMap(obj) {
	// obj.event is the event that triggered the call
	switch (obj.event)
	{
		case "zoomFinished":
			// Write the breadcrumb trail
			jqmWriteBreadcrumbs(obj.clickedFeatures);
			break;
		case "buttonClicked":
			// Back button was clicked and the dialog popup is open: close it
			if ((obj.button == "back") && $("#jqm_dialog").dialog("isOpen") === true)
				$("#jqm_dialog").dialog("close"); 
			break;
	}
}

// Write the breadcrumbs of the map
function jqmWriteBreadcrumbs(features) {
	var title = "US States";
	if (features.length > 0) { 
		for (i = features.length; i > 0; i--)
			title += " &raquo; " + features[features.length - i].label;
	}
	$("#jqm_breadcrumbs").html(title);
}

// Set the year on the slider
function jqmSelectYear(year) { 
	$("#slider").slider('value', year); 
}	

// Set the year from the slider
function jqmSetYear(year) {
	if ($("#jqm_dialog").dialog("isOpen") === true) { $("#jqm_dialog").dialog("close"); }	
	jqmMapYear = year;
	
	// Load a new theme
	var theme = "jquerymaps/theme/" + jqmMapYear + "/us.xml";
	jqmMap.loadInitialTheme(theme);
}

var popup_width = 800;
var popup_height = 250;

function showlevels()
{
	var distance = jqmMap.getMarkers('lat');
	alert(distance);
}

// Display the popup when an feature has been clicked
function jqmDisplayFeaturePopup(obj) {

	var dialog_width = popup_width;
	var dialog_height = popup_height;

	state = obj.label_name;
	var state_click_results;
	//alert('input state is ' + state);
	
	$.ajax({
	  type: "POST",
	  url: "jquerymaps/theme/2010/getlocations.php",
	  data: { state: state},
	  success: function(s){
		if(s=="")
		{
			s = "There are no locations for this state.";
			$("#jqm_dialog").css('height','50px');
		}
		$("#jqm_box_dialog").html(s).show();
	  }
	});
	
	$("#jqm_dialog").dialog({autoOpen: true, dialogClass: 'box_dialog', modal: false, width: dialog_width, height: dialog_height, position: { of: "#jqm_map" }, resizable: true, show: "blind", title: obj.label });

}

function closePopup()
{
	alert('s');
	$("#jqm_box_dialog").hide();
}

function popuptest(obj) {
	var dialog_width = 300;
	var dialog_height = 55;

	var citystate 			= 	obj.label;
	var marker_category		=	obj.category;
		
	$("#jqm_box_dialog").html('').show();
	
	$("#jqm_dialog").dialog({
	autoOpen: true, 
	dialogClass: 'box_dialog', 
	modal: false, 
	width: dialog_width, 
	height: dialog_height, 
	resizable: false,  
	title: obj.market 
	});

}

// Display the popup when an feature has been clicked
function jqmDisplayMarkerPopup(obj) {

	var dialog_width = popup_width;
	var dialog_height = popup_height;

	var citystate 			= 	obj.label;
	var marker_category		=	obj.category;
		
	$.ajax({
	  type: "POST",
	  url: "jquerymaps/theme/2010/getlocations_per_marker.php",
	  data: { citystate: citystate, category: marker_category},
	  success: function(s){
		$("#jqm_box_dialog").html(s).show();
	  }
	});
	
	$("#jqm_dialog").dialog({autoOpen: true, dialogClass: 'box_dialog', modal: false, width: dialog_width, height: dialog_height, position: { of: "#jqm_map" }, resizable: true, show: "blind", title: obj.market });

}


// Display the popup when a marker has been clicked
function jqmDisplayMarkerPopup_old(obj) {


	$("#jqm_dialog").dialog({autoOpen: true, dialogClass: 'box_dialog', modal: false, width: 300, height: 100, position: { of: "#jqm_map" }, resizable: false, show: "blind", title: obj.label });
	$("#jqm_box_dialog").html("<b>" + obj.label + "</b><br>" + obj.popup).show();
	$("#jqm_box_canvas").hide();
	$("#ytplayer").hide();
}

// Show or hide a feature category
function jqmShowOrHideFeaturesRange(category, feature_category) { 
	if ($("#feature_" + category).hasClass("enable") == true) {
		$("#feature_icon_" + category).css("background-color","#E5E5E5");
		$("#feature_" + category).removeClass("enable").addClass("disable").html("Show " + $("#feature_" + category).attr('label'));
		jqmMap.hideFeaturesByCategory("state_" + category); 
	} else {
		$("#feature_icon_" + category).css("background-color", $("#feature_icon_" + category).attr('color'));
		$("#feature_" + category).removeClass("disable").addClass("enable").html("Hide " + $("#feature_" + category).attr('label'));
		jqmMap.showFeaturesByCategory("state_" + category); 
	}
}


// Show or hide a marker category
function jqmShowOrHideMarkersRange(category) { 

var all_categories = ["marine_pool_neutral", "marine_pool_private", "marine_pool_coop", "domestic_pool", "depots_term_lease"];
var marine_pool_categories = ["marine_pool_neutral", "marine_pool_private", "marine_pool_coop"];

	if(category=='hideAll')
	{

		for	(index = 0; index < all_categories.length; index++) {
			$("#category_icon_"  + all_categories[index]).fadeTo("fast", 0.4);
			$("#category_" + all_categories[index]).removeClass("enable").addClass("disable").html("" + $("#category_" + all_categories[index]).attr('label'));
			jqmMap.hideMarkersByCategory(all_categories[index]); 
		}

	} else if(category=='showAll') {
	
		for	(index = 0; index < all_categories.length; index++) {
			$("#category_icon_" + all_categories[index]).fadeTo("fast", 1);
			$("#category_" + all_categories[index]).removeClass("disable").addClass("enable").html("" + $("#category_" + all_categories[index]).attr('label'));
			jqmMap.showMarkersByCategory(all_categories[index]); 
		}	

	} else if(category=='show_all_marine_pools') {

		//Just an example of one show function: jqmMap.showMarkersByCategory('marine_pool_neutral');

		for	(index = 0; index < marine_pool_categories.length; index++) {
			$("#category_icon_" + marine_pool_categories[index]).fadeTo("fast", 1);
			$("#category_" + marine_pool_categories[index]).removeClass("disable").addClass("enable").html("" + $("#category_" + marine_pool_categories[index]).attr('label'));
			jqmMap.showMarkersByCategory(marine_pool_categories[index]); 
		}	
	
		$("#category_depots_term_lease").fadeTo("fast", 1);
		$("#category_depots_term_lease").removeClass("disable").addClass("enable").html("" + $("#category_depots_term_lease").attr('label'));
		jqmMap.showMarkersByCategory("depots_term_lease"); 
	
	} else if(category=='hide_all_marine_pools') {
		//Just an example of one show function:  jqmMap.hideMarkersByCategory('marine_pool_neutral');

		for	(index = 0; index < marine_pool_categories.length; index++) {
			//alert(marine_pool_categories[index]);
			$("#category_icon_"  + marine_pool_categories[index]).fadeTo("fast", 0.4);
			$("#category_" + marine_pool_categories[index]).removeClass("enable").addClass("disable").html("" + $("#category_" + marine_pool_categories[index]).attr('label'));
			jqmMap.hideMarkersByCategory(marine_pool_categories[index]); 
		}	

			$("#category_depots_term_lease").fadeTo("fast", 0.4);
			$("#category_depots_term_lease").removeClass("enable").addClass("disable").html("" + $("#category_depots_term_lease").attr('label'));
			jqmMap.hideMarkersByCategory("depots_term_lease"); 

		
	} else {


		if ($("#category_" + category).hasClass("enable") == true) {
			$("#category_icon_"  + category).fadeTo("fast", 0.4);
			$("#category_" + category).removeClass("enable").addClass("disable").html("" + $("#category_" + category).attr('label'));
			jqmMap.hideMarkersByCategory(category); 
		} else {
			$("#category_icon_" + category).fadeTo("fast", 1);
			$("#category_" + category).removeClass("disable").addClass("enable").html("" + $("#category_" + category).attr('label'));
			jqmMap.showMarkersByCategory(category); 
		}

	}	

	
	jqmMap.refreshMarkers();
}

// Scale a feature
function jqmScaleFeature(id, scale) {
	jqmMap.hideMarkersByCategory("*"); 
	jqmMap.refreshMarkers();		
	jqmMap.scaleFeature(id, scale);
}

// Unscale features
function jqmUnscaleFeatures() {
	jqmMap.showMarkersByCategory("*"); 
	jqmMap.refreshMarkers();		
	jqmMap.unscaleFeatures();
	jqmMap.redraw();
}

// Focus on a point and show a popup
function jqmFocusOnPoint(id, lat, lon, scale) {
	jqmMap.focusOnPoint({lat: lat, lon: lon, scale:	scale});
	var mk = jqmMap.getMarkers();
	for (i = 0; i < mk.length; i++) {
		if (mk[i]["id"] == id) { 
			jqmDisplayMarkerPopup(mk[i]); 
		}
	}
}

// Find a marker and display the popup
function jqmFindMarkerAndDisplayPopup(id) {
	var mk = jqmMap.getMarkers();
	for (i = 0; i < mk.length; i++) {
		if (mk[i]["id"] == id) { jqmDisplayMarkerPopup(mk[i]); }
	}
}

// Display the initial view
function jqmDisplayInitialView() {
	if ($("#jqm_dialog").dialog("isOpen") === true) { $("#jqm_dialog").dialog("close"); }
	jqmMap.displayInitialView();
}

// Display/hide a box
function toogleBox(id) { 
	if ($("#" + id).is(":visible") == false) {
		$("#" + id + "_icon").removeClass("more").addClass("less");
	} else {
		$("#" + id + "_icon").removeClass("less").addClass("more");
	}
	$("#" + id).slideToggle("fast"); 
}

function numberFormat(nStr)
{
	nStr += '';
	x = nStr.split('.');
	x1 = x[0];
	x2 = x.length > 1 ? '.' + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1)) {
		x1 = x1.replace(rgx, '$1' + ',' + '$2');
	}
	return x1 + x2;
}

	// show video
	function showVideo() {
		$("#jqm_dialog").dialog({autoOpen: true, dialogClass: 'box_dialog', modal: true, width: 590, height: 365, position: { of: "#jqm_map" }, resizable: false, title: "About jQueryMaps", beforeClose: function(event, ui) { ytbplayer.stopVideo(); }		});	
		$("#ytplayer").show();
		$("#jqm_box_dialog").hide();
		$("#jqm_box_canvas").hide();
	
		if (ytbplayer == undefined) {
			ytbplayer = new YT.Player('ytplayer', {width: "560", height: "315", videoId: '4vYstDr-vZ0', events: { 'onReady': onPlayerReady,  'onStateChange': onPlayerStateChange }});
		} else {
			ytbplayer.seekTo(0,true);
		}
	}

	// autoplay video
	function onPlayerReady(event) { }

	// when video ends
	function onPlayerStateChange(event) { if(event.data === 0) { $("#jqm_dialog").dialog("close") } }