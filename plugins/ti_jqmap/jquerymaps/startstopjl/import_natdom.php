<?php

	session_start();
	

	
	ini_set('display_errors',1);  
	error_reporting(E_ERROR  );

	$table = "jqm_locations";
	include("jquerymaps/libs/jqmDB.php");
	
	unset($_SESSION['loggedin']);

?>

<!DOCTYPE html>
<html>
<head>

<style>


</style>

</head>

<body>


<table>

<?php

		$sql = " SELECT * FROM tracintermodal.natdompool n; ";
		
		$query = $jqm_db->query($sql);
			
			while ($rd = $query->fetch_assoc()) {

					$ID 			= $rd['ID'];
					$Ramp 			= $rd['Ramp'];
					$latitude 		= $rd['latitude'];
					$longitude 		= $rd['longitude'];
					$Location 		= $rd['Location'];
					$Addr 			= $rd['Addr'];
					$City 			= $rd['City'];
					$State			= $rd['State'];
					$Zip			= $rd['Zip'];
					$Phone			= $rd['Phone'];
					
					echo ("
						<tr>
							<td>$ID</td>
							<td>$Ramp</td>
							<td>$latitude</td>
							<td>$longitude</td>
							<td>$Location</td>
							<td>$Addr</td>
							<td>$City</td>
							<td>$State</td>
							<td>$Zip</td>
							<td>$Phone</td>
						</tr>
					");

					
					$insert = ("
								insert into jquerymaps.jqm_natdom
								(regionID,locationID,location,address,city,state,zip,Phone,lat,lon)
								values 
								('',$ID,'$Ramp','$Addr','$City','$State','$Zip','$Phone','$latitude','$longitude');
							");
							//echo "<tr><td colspan='10'>$insert</td></tr>";
							$jqm_db->query($insert);
					
			}
		
	
	
	
?>

</table>
</body>
</html>