<?php

ini_set('display_errors',1);  
error_reporting(E_ALL);
	
	include("jquerymaps/libs/jqmDB.php");
	

	$table = "jqm_locations";
	echo "$table<br/>";

		$sql = " SELECT a.*  FROM $table a where lat='' or lon=''  ";
		$query = $jqm_db->query($sql);
		
		$not_found 	= 0;
		$found  	= 0;
		
			while ($rd = $query->fetch_assoc()) {

					$id 		= $rd['locationID'];
					$address 	= $rd['address'];
					$city 		= $rd['city'];
					$state 		= $rd['state'];
					$zip 		= $rd['zip'];
					
					$a="$address, $city, $state, $zip";
					
					echo "$a<br/>";
					
					$address = urlencode($a);
					/*
					$link = "http://maps.google.com/maps/api/geocode/xml?address=".$address."&sensor=false";
					$file = file_get_contents($link);

					if(!$file)  {
					  echo "Err: No access to Google service: ".$a."<br/>\n";
					}else {
					  $get = simplexml_load_string($file);

					  if ($get->status == "OK") {
						  $found++;
						  $lat = (float) $get->result->geometry->location->lat;
						  $long = (float) $get->result->geometry->location->lng;
						  $update = "update $table set latitude='$lat', longitude='$long' where marker_id=$id; ";
						  //echo "($found) ID: $id...lat: $lat...long: $long...address: $a<br/>\n";
						  echo "$update<br/>\n";
						  $jqm_db->query($update);
					  }else{
						$not_found++;
						echo "Err: address not found: ($not_found)".$a."<br/>\n";
					  }
					}
					*/


					
			}
		
	
	
	
?>