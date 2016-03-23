<?php
	
	$global_color = '#f4ed92';
	
	echo "<jqm_features xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceSchemaLocation=\"../xsd/jqm_features.xsd\">\n";
	
	include("../libs/jqmDB.php");
	


	$sql = "SELECT s.countryID, s.stateID, s.state FROM jqm_states s ORDER BY s.stateID";
	$query = $jqm_db->query($sql);

	if ($query->num_rows > 0)
		while ($rd = $query->fetch_assoc())
			echo "<feature id=\"" . strtolower($rd['countryID'] . "_" . $rd['stateID']) . "\" category=\"state\" label=\"\" visible=\"false\" />\n";
	$query->close();
	$jqm_db->close();

	echo "</jqm_features>";
?>