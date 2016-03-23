<?php

	include("../../../jqmDB.php");

	if(isset($_POST['citystate']))
	{
		$state = $_POST['citystate'];
	} else {
		$state = 'Haslet, TX';
	}
	
	$bg = 'none';
	
	$city_state = explode(',',$state);
	$city 	= trim($city_state[0]);
	$state 	= trim($city_state[1]);
	
	
	$sql = "SELECT * FROM jqm_locations l where city='$city' and state='$state' order by location ";
	$query = $jqm_db->query($sql);

	echo "<h2>Locations For This Marker:</h2>";
	echo "<table>";
	
	if ($query->num_rows > 0)
		while ($rd = $query->fetch_assoc()) {
		
				$location 		= 	$rd['location'];
				$address 		= 	$rd['address'];
				$city 			= 	$rd['city'];
				$state 			= 	$rd['state'];
				
				if($bg == '#FFF')
				{
					$bg = '#DDD';
				} else {
					$bg = '#FFF';
				}
		
				echo ("
				<tr class='state_results' style='background:$bg;' >
				<td>$location</td><td style='padding:0px 18px;'>$address</td><td>$city, $state</td></tr>
				</tr>
				");
		}
	echo "</table>";
	$query->close();
	$jqm_db->close();
	
	
?>