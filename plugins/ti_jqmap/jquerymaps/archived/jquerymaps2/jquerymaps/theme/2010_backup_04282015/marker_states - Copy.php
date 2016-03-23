<?php
	header("Content-Type: application/xml; charset=utf-8");
	echo "<jqm_markers xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceSchemaLocation=\"../../xsd/jqm_markers.xsd\">\n";
	
	include("../../../jqmDB.php");
	
	$r = ""; if (!empty($_REQUEST["r"])) { $r = $_REQUEST["r"]; }

	$sql = "SELECT l.address, l.city, l.state, l.regionID, AVG(l.lat) AS lat, AVG(l.lon) AS lon ";
	$sql .= "FROM jqm_locations l ";
	$sql .= "WHERE l.lat <> 0 AND l.lon <> 0 ";
	if ($r != "") { $sql .= "AND l.regionID = '" . $r . "' "; }
	$sql .= "GROUP BY l.city, l.state, l.regionID ";
	$query = $jqm_db->query($sql);
	
	$pool_categories = array();
	$pool_categories['metro'] = 'marine_pool_neutral';
	$pool_categories['tgrp'] = 'marine_pool_neutral';
	$pool_categories['tmep'] = 'marine_pool_neutral';
	$pool_categories['tmmp'] = 'marine_pool_neutral';
	$pool_categories['tmwp'] = 'marine_pool_neutral';
	$pool_categories['tncp'] = 'marine_pool_neutral';
	$pool_categories['tpnp'] = 'marine_pool_neutral';
	$pool_categories['tpsp'] = 'marine_pool_neutral';


	$pool_categories['cocp'] = 'marine_pool_coop';
	$pool_categories['dccp'] = 'marine_pool_coop';
	$pool_categories['gccp'] = 'marine_pool_coop';
	$pool_categories['labtc'] = 'marine_pool_coop';
	$pool_categories['mccp'] = 'marine_pool_coop';
	$pool_categories['mwcp'] = 'marine_pool_coop';
	$pool_categories['sacp'] = 'marine_pool_coop';
	$pool_categories['wccp'] = 'marine_pool_coop';
	
	$pool_categories['tpcp'] = 'marine_pool_private';
	$pool_categories['bnsf'] = 'domestic_pool';
	$pool_categories['actdp'] = 'depots_term_lease';
	

	
	if ($query->num_rows > 0)
		while ($rd = $query->fetch_assoc()) {
		
			if(array_key_exists(strtolower($rd['regionID']),$pool_categories)) {
				$location_category = $pool_categories[strtolower($rd['regionID'])];
				$street = $rd['address'];
				$street = preg_replace("/[^A-Za-z0-9\- ]/", '', $street);
				$city = $rd['city'];
				$state = $rd['state'];
				$marker_address = "$street&lt;br/&gt;$city, $state";
				echo "<marker bruce='49' popup='$marker_address' id=\"" . $rd['city'] . "\" category='" . $location_category . "' label=\"" . htmlentities($rd['city'] . ", " . $rd['state']) . "\" lat=\"" . $rd['lat'] . "\" lon=\"" . $rd['lon'] . "\" />\n";
			}
			
		}
	$query->close();
	$jqm_db->close();

	echo "</jqm_markers>";
?>