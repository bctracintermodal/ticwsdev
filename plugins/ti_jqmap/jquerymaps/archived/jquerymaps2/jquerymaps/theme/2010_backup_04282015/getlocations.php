<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

	include("../../../jqmDB.php");

	if(isset($_POST['state']))
	{
		$state = $_POST['state'];
	}
	
	$bg = 'none';

	require_once('icons.php');
	echo "<h2>Locations For This State:</h2>";
	require_once('table_headings.php');
	
	foreach($icons as $cat_key=>$cat_val)
	{

				$sql = "SELECT * FROM map_markers l where state='$state' and marker_category='$cat_key' ";
				$query = $jqm_db->query($sql);
				
				if ($query->num_rows > 0) 
				{
				
					echo ("<tr class='state_results' style='padding:10px 0px; background:#333; color:#EEE;' ><td colspan='10'>" . $icon_headings[$cat_key] . "</td></tr>");
				
					while ($rd = $query->fetch_assoc()) {
					
							$location 		= 	$rd['location_name'];
							$address 		= 	$rd['street'];
							$city 			= 	$rd['city'];
							$state 			= 	$rd['state'];
							$cat 			= 	$rd['marker_category'];
							$pool 			= 	$rd['pool'];

							
							if($bg == '#FFF')
							{
								$bg = '#DDD';
							} else {
								$bg = '#FFF';
							}
					
							$icon = '../../../jquerymaps/jquerymaps/images/icons/' . $icons[$cat];		
							
							echo ("
							<tr class='state_results' style='background:$bg;' >
							<td align='center' width='50' ><img src='$icon' /></td>
							<td>$location</td>
							<td style='padding:0px 18px;'>$address</td>
							<td>$city, $state</td>
							<td>$pool</td>
							</tr>
							");
					}
				} 
	}

	echo "</table>";	
	
	$query->close();
	$jqm_db->close();
	
	
?>