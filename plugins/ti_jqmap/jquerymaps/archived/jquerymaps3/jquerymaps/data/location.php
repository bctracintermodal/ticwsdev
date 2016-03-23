<?php
	include("../libs/jqmDB.php");
	
	$id = ""; if (!empty($_REQUEST["id"])) { $id = $_REQUEST["id"]; }
	$lat = "";
	$lon = "";
	$list = "";

	$sql = "SELECT l.* FROM jqm_locations l WHERE l.lat <> 0 AND l.lon <> 0 AND l.metro_city = '" . $id . "' ORDER BY l.location";
	$query = $jqm_db->query($sql);

	if ($query->num_rows > 0) {
		
		$list .= "<table class='location'>";
		$list .= "<tr><th>Metro City</th>";
		$list .= "<th>Location</th>";
		$list .= "<th>Address</th>";
		$list .= "<th>City</th></tr>";
		
		while ($rd = $query->fetch_assoc()) {
			$list .= "<tr>";
			$list .= "<td>" . $rd['metro_city'] . "</td>";
			$list .= "<td>" . $rd['location'] . "</td>";
			$list .= "<td>" . $rd['address'] . "</td>";
			$list .= "<td>" . $rd['city'] . ", " . $rd['state'] . "</td>";
			$list .= "</tr>";
			
			$lat = $rd['lat'];
			$lon = $rd['lon'];
		}
		
		$list .= "</table>";
		$list .= "<a href=\"Javascript:jqmDisplayGoogle('" . $id . "','" . $lat . "','" . $lon . "');\" class=\"button\">Google Map</a>";		
	}
	$query->close();
	$jqm_db->close();
	
	echo $list;
?>