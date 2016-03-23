<?php
	echo "<jqm_features xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceSchemaLocation=\"../xsd/jqm_features.xsd\">\n";
	
	include("../libs/jqmDB.php");
	
	$sql = "SELECT r.* FROM jqm_regions r ";
	$query = $jqm_db->query($sql);

	if ($query->num_rows > 0)
		while ($rd = $query->fetch_assoc()) {
			echo "<feature id=\"region_" . strtolower($rd['regionID']) . "\" category=\"region\" label=\"" . htmlentities($rd['region']) . "\" label_map=\"" . strtoupper($rd['regionID']) . "\" >";
			echo "<style event=\"onMouseOut\" fillColor=\"" . $rd['region_color'] . "\" strokeColor=\"#fff\" strokeWidth=\"1\" />\n";
			echo "</feature>\n";
		}
	$query->close();	

	echo "<feature id=\"region_none\" category=\"region_none\" label=\"\" />";

	$sql = "SELECT s.countryID, s.stateID, s.state FROM jqm_states s ORDER BY s.stateID";
	$query = $jqm_db->query($sql);

	if ($query->num_rows > 0)
		while ($rd = $query->fetch_assoc())
			echo "<feature id=\"" . strtolower($rd['countryID'] . "_" . $rd['stateID']) . "\" category=\"state\" label=\"\" />\n";
	$query->close();
	$jqm_db->close();

	echo "</jqm_features>";
?>