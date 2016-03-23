<?php
	header("Content-Type: application/xml; charset=utf-8");
	echo "<jqm_markers xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceSchemaLocation=\"../../xsd/jqm_markers.xsd\">\n";
	
	include("../../../jqmDB_ti.php");
	

	

		$sql = " SELECT a.*  FROM activedepots a where latitude!='' and longitude!='' ";
		$query = $jqm_db->query($sql);
		if ($query->num_rows > 0)
		{
			while ($rd = $query->fetch_assoc()) {
					$loc_number = $rd['Location'];
					$depot 		= htmlentities($rd['Depot']);
					$addr1 		= str_replace(' ','+',$rd['Addr1']);
					$addr2 		= str_replace(' ','+',$rd['Addr2']);
					$latitude 	= $rd['latitude'];
					$longitude 	= $rd['longitude'];
					
				
					echo ("
					<marker 
					popup=\"$depot\" 
					id=\"$loc_number\" 
					category=\"depots_term_lease\" 
					label=\"$depot\" 
					lat=\"$latitude\" 
					lon=\"$longitude\" 
					/>\n");
			}
		}	
	



		$sql = " SELECT a.*  FROM natdompool a where latitude!='' and longitude!='' ";
		$query = $jqm_db->query($sql);
		if ($query->num_rows > 0)
		{
			while ($rd = $query->fetch_assoc()) {
					$loc_number = $rd['Location'];
					$depot 		= htmlentities($rd['Depot']);
					$addr 		= str_replace(' ','+',$rd['Addr1']);
					$city 		= $rd['City'];
					$state	 	= $rd['State'];
					$zip	 	= $rd['Zip'];
					$latitude 	= $rd['latitude'];
					$longitude 	= $rd['longitude'];
					
				
					echo ("
					<marker 
					popup=\"$depot\" 
					id=\"$loc_number\" 
					category=\"domestic_pool\" 
					label=\"$depot\" 
					lat=\"$latitude\" 
					lon=\"$longitude\" 
					/>\n");
			}
		}	


	$pool_categories = array();
	$pool_categories['metro'] = 'marine_pool_neutral';
	$pool_categories['tgrp'] = 'marine_pool_neutral';
	$pool_categories['tmep'] = 'marine_pool_neutral';
	$pool_categories['tmmp'] = 'marine_pool_neutral';
	$pool_categories['tmwp'] = 'marine_pool_neutral';
	$pool_categories['tncp'] = 'marine_pool_neutral';
	$pool_categories['tpnp'] = 'marine_pool_neutral';
	$pool_categories['tpsp'] = 'marine_pool_neutral';


	$pool_categories['cocp'] = 'marine_pool_coop';
	$pool_categories['dccp'] = 'marine_pool_coop';
	$pool_categories['gccp'] = 'marine_pool_coop';
	$pool_categories['labtc'] = 'marine_pool_coop';
	$pool_categories['mccp'] = 'marine_pool_coop';
	$pool_categories['mwcp'] = 'marine_pool_coop';
	$pool_categories['sacp'] = 'marine_pool_coop';
	$pool_categories['wccp'] = 'marine_pool_coop';
	
	$pool_categories['tpcp'] = 'marine_pool_private';


		$sql = " SELECT a.*  FROM marinepool a where latitude!='' and longitude!='' ";
		$query = $jqm_db->query($sql);
		if ($query->num_rows > 0)
		{
			while ($rd = $query->fetch_assoc()) {
					$loc_number = $rd['Location'];
					$depot 		= htmlentities($rd['Depot']);
					$addr 		= str_replace(' ','+',$rd['Addr1']);
					$city 		= $rd['City'];
					$state	 	= $rd['State'];
					$zip	 	= $rd['Zip'];
					$latitude 	= $rd['latitude'];
					$longitude 	= $rd['longitude'];
					$ramp 	= $rd['Ramp'];
					
				
					echo ("
					<marker 
					popup=\"$depot\" 
					id=\"$loc_number\" 
					category=\"marine_pool_coop\" 
					label=\"$depot\" 
					lat=\"$latitude\" 
					lon=\"$longitude\" 
					/>\n");
			}
		}	
		
		




	
	
	
	
	
	
	$query->close();
	$jqm_db->close();
	echo "</jqm_markers>";
?>