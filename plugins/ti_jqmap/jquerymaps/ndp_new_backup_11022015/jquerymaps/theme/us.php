<?php
	$theme = "id=\"us\" shapesUrl=\"../maps/us_regions.xml\" backgroundImageUrl=\"\" ";
	$theme .= "featuresUrl=\"feature_states.php\" featureCategoriesUrl=\"feature_categories.php\" ";
	$theme .= "markersUrl=\"marker_states.php\" markerCategoriesUrl=\"marker_categories.php\" ";

	echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
	echo "<jqm_theme xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceSchemaLocation=\"../xsd/jqm_theme.xsd\" reloadInterval=\"\" reloadFeatures=\"false\" reloadFeatureCategories=\"false\" reloadMarkers=\"false\" reloadMarkerCategories=\"false\" " . $theme . " >";
	echo "</jqm_theme>";
?>