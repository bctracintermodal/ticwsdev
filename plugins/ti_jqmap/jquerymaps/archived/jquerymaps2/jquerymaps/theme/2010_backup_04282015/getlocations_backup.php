<?php

	include("../../../jqmDB.php");

	if(isset($_POST['state']))
	{
		$state = $_POST['state'];
	} else {
		$state = 'TX';
	}
	
	$bg = 'none';
	
	$sql = "SELECT * FROM jqm_locations l where state='$state' order by location ";
	$query = $jqm_db->query($sql);

	
	if ($query->num_rows > 0) 
	{
		echo "<h2>Locations For This State:</h2>";
		echo "<table>";
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
	} 
	$query->close();
	$jqm_db->close();
	
	
?>