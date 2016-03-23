		<?php
	include("../libs/jqmDB.php");
	
	$id = ""; if (!empty($_REQUEST["id"])) { $id = $_REQUEST["id"]; }
	$list = array();

	$sql = "SELECT l.* FROM jqm_locations_backup l WHERE l.lat <> 0 AND l.lon <> 0 AND l.metro_city = '" . $id . "' ORDER BY l.location";
	$query = $jqm_db->query($sql);

	if ($query->num_rows > 0)
		while ($rd = $query->fetch_assoc())
			array_push($list, array("id"=>$rd['locationID'], "location"=>$rd['location'], "address"=>$rd['address'], "city"=>$rd['city'], "state"=>$rd['state'], "lat"=>$rd['lat'], "lon"=>$rd['lon']));
	$query->close();
	$jqm_db->close();
	
    echo json_encode($list);
?>