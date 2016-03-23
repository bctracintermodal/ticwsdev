<?php
	header("Content-Type: application/xml; charset=utf-8");
	echo "<jqm_markers xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceSchemaLocation=\"../../xsd/jqm_markers.xsd\">\n";
	
	include("../../../jqmDB_ti.php");
	
	$sql = " SELECT a.*  FROM map_markers a where latitude!='' and longitude!='' ";
		$query = $jqm_db->query($sql);
		if ($query->num_rows > 0)
		{
			while ($rd = $query->fetch_assoc()) {
					$marker_id 			= 	$rd['marker_id'];
					$marker_cat 		= 	$rd['marker_category'];
					$location_name 		= 	htmlentities($rd['location_name']);
					$street 			=	htmlentities($rd['street']);
					$city 				=	htmlentities($rd['city']);
					$state 				=	htmlentities($rd['state']);
					$zip 				=	$rd['zip'];
					$latitude 			= 	$rd['latitude'];
					$longitude 			= 	$rd['longitude'];
					$market 			= 	$rd['market'];
					
					$popup = "$location_name / $street / $city, $state $zip";
					$label = "$city, $state";
				
					echo ("
					<marker 
					popup=\"$popup\" 
					id=\"$marker_id\" 
					category=\"$marker_cat\" 
					market=\"$market\" 
					label=\"$label\" 
					lat=\"$latitude\" 
					lon=\"$longitude\" 
					/>\n");
			}
		}	
	




	
	
	
	
	
	
	$query->close();
	$jqm_db->close();
	echo "</jqm_markers>";
?>