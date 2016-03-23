<?php
	header("Content-Type: application/xml; charset=utf-8");
	echo "<jqm_markers xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceSchemaLocation=\"../xsd/jqm_markers.xsd\">\n";
	
	include("../libs/jqmDB.php");
	
	$r = ""; 
	if (!empty($_REQUEST["r"])) { $r = $_REQUEST["r"]; }

	$map_type = $_REQUEST['map_type'];
	switch($_REQUEST['map_type'])
	{
		case 1:
			$sql = "SELECT UCASE(l.metro_city) AS metro_city, AVG(l.lat) AS lat, AVG(l.lon) AS lon ";
			$sql .= "FROM jqm_natdom l ";
			$sql .= "WHERE l.lat <> 0 AND l.lon <> 0   ";
			$sql .= "GROUP BY l.metro_city ";
			break;
		case 2:
			$sql = ("
				SELECT UCASE(l.metro_city) AS metro_city, AVG(l.lat) AS lat, AVG(l.lon) AS lon
				FROM jqm_locations l
				WHERE is_tpcp='on'
				GROUP BY l.metro_city
			");
			break;
		default:
				$sql = "SELECT UCASE(l.metro_city) AS metro_city, AVG(l.lat) AS lat, AVG(l.lon) AS lon ";
				$sql .= "FROM jqm_locations l ";
				$sql .= "WHERE l.lat <> 0 AND l.lon <> 0 ";
				if ($r != "") { $sql .= "AND l.regionID = '" . $r . "' "; }
				$sql .= "GROUP BY l.metro_city ";	
				$map_type = 0;
		}
	
	$query = $jqm_db->query($sql);

	if ($query->num_rows > 0)
		while ($rd = $query->fetch_assoc()) {
			echo "<marker id=\"" . $rd['metro_city'] . "\" category=\"location$map_type\" label=\"" . htmlentities($rd['metro_city']) . "\" lat=\"" . $rd['lat'] . "\" lon=\"" . $rd['lon'] . "\" />\n";
		}
	$query->close();
	$jqm_db->close();

	echo "</jqm_markers>";
?>