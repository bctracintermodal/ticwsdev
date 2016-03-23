<?php
	$theme = "id=\"us\" shapesUrl=\"../maps/us_regions.xml\" backgroundImageUrl=\"\" \n";
	$theme .= "featuresUrl=\"feature_states.php\" featureCategoriesUrl=\"feature_categories.xml\" \n";
	$theme .= "markersUrl=\"marker_states.php\" markerCategoriesUrl=\"marker_categories.php\" \n";

	echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
	echo ("<jqm_theme xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" \n 
	xsi:noNamespaceSchemaLocation=\"../xsd/jqm_theme.xsd\" 
	reloadInterval=\"\"  
	reloadFeatures=\"false\"  
	reloadFeatureCategories=\"false\" 
	reloadMarkers=\"false\"  
	reloadMarkerCategories=\"false\"  \n" . $theme . " >\n");
	echo "</jqm_theme>";
?>