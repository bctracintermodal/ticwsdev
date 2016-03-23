<?php

ini_set('display_errors',1);  
error_reporting(E_ALL);
	
	include("../../../jqmDB_ti.php");
	

	

		$sql = " SELECT a.*  FROM activedepots a where latitude='' or longitude='' and ID>17";
		$query = $jqm_db->query($sql);
		if ($query->num_rows > 0)
		{
			while ($rd = $query->fetch_assoc()) {
					$loc_number = $rd['Location'];
					$depot 		= htmlentities($rd['Depot']);
					$addr1 		= urlencode($rd['Addr1']);
					$addr2 		= urlencode($rd['Addr2']);
					$id 		= $rd['ID'];
					
					$fullurl = "https://maps.googleapis.com/maps/api/geocode/json?address=$addr1+$addr2&sensor=true";
					$string .= file_get_contents($fullurl); // get json content
					$json_a = json_decode($string, true); //json decoder

					if ($json_a->status == "OK") {
						$lat =  $json_a['results'][0]['geometry']['location']['lat']; // get lat for json
						$lon =  $json_a['results'][0]['geometry']['location']['lng']; // get ing for json					
					}
					
					$jqm_db->query("update activedepots set latitude='$lat', longitude='$lon' where ID=$id ");

					echo ("
					$id / $depot / $addr1 / $addr2 / $lat / $lon<br/>
					");
					
			}
		}	
	
	
	
	
	
	
	
	$query->close();
	$jqm_db->close();
	echo "</jqm_markers>";
?>