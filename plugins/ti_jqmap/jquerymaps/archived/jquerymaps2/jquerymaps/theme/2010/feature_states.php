<?php
	header("Content-Type: application/xml; charset=utf-8");
	echo "<jqm_features xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceSchemaLocation=\"../../xsd/jqm_features.xsd\">\n";
	
	include("../../../jqmDB.php");
	

	$sql = "SELECT * FROM jqm_states l where stateID not in ('ma','pr','hi')";
	//echo "$sql";
	$query = $jqm_db->query($sql);

	
	if ($query->num_rows > 0)
		while ($rd = $query->fetch_assoc()) {
		
				$stateID 		= 	$rd['stateID'];
				//echo "stateid: $stateID<br/>";
				$stateName 		= 	$rd['state'];
				$labelMap 		=	strtoupper($stateID);
		
				echo ('
				<feature 
				id="us_'.$stateID.'" 
				category="state_5" 
				label="'.$stateName.'" 
				label_map="" 
				label_name="'.$labelMap.'" 
				popup="Locations: 7" 
				pop_2010="4779736" 
				pop_2000="4447100" 
				pop_1990="4040587" 
				pop_1980="3893888" 
				pop_1970="3444165"
				/>');
		}
	$query->close();
	$jqm_db->close();

	echo "</jqm_features>";
?>