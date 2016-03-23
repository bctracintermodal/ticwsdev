<?php

	include("../../../jqmDB_ti.php");

	if(isset($_POST['citystate']))
	{
		$state = $_POST['citystate'];
	}
	
	$bg = 'none';
	
	$city_state 		= explode(',',$state);
	$city 				= trim($city_state[0]);
	$state 				= trim($city_state[1]);

	$sql = "SELECT market FROM map_markers l where city='$city' and state='$state'  ";
	$query = $jqm_db->query($sql);
	while ($rd = $query->fetch_assoc()) {
		$market 		= 	$rd['market'];
	}
	
	require_once('icons.php');
	
	if($market!="")
	{
	
				echo "<h2>Locations For This Market:</h2>";
				require_once('table_headings.php');

				foreach($icons as $cat_key=>$cat_val)
				{
					$sql = "SELECT * FROM map_markers l where market='$market' and marker_category='$cat_key' ";
					$query = $jqm_db->query($sql);

					if ($query->num_rows > 0)
					{

						echo ("<tr class='state_results' style='padding:10px 0px; background:#333; color:#EEE;' ><td colspan='10'>" . $icon_headings[$cat_key] . "</td></tr>");

					
						while ($rd = $query->fetch_assoc()) {
						
								$location_name 		= 	$rd['location_name'];
								$street 			= 	ucwords(strtolower($rd['street']));
								$city 				= 	trim(ucwords(strtolower($rd['city'])));
								$state 				= 	trim($rd['state']);
								$zip 				= 	$rd['zip'];
								$cat 				= 	$rd['marker_category'];
								$pool 				= 	$rd['pool'];
								$lat				= 	$rd['latitude'];
								$lon				= 	$rd['longitude'];
								$google_map_url		=	"$street+$city+$state+$zip";
								$google_map_url		=	str_replace(' ','+',$google_map_url);
								
								if($bg == '#FFF')
								{
									$bg = '#DDD';
								} else {
									$bg = '#FFF';
								}
								
								$icon = '../../../jquerymaps/jquerymaps/images/icons/' . $icons[$cat];

								$google_map = "http://maps.google.com/?ie=UTF8&hq=&ll=".$lat.",".$lon."&z=13";
								$google_map = "https://maps.google.com?daddr=" . $google_map_url;
								
								echo ("
								<tr class='state_results' style='background:$bg;' >
								<td align='center' align='left' width='25' ><img src='$icon'  /></td><td>$location_name</td>
								<td style='padding:0px 18px;'><a style='color:#3399FF;' target='_blank' href='$google_map'>$street</a></td>
								<td>$city, $state $zip</td>
								<td>$pool</td>
								</tr>
								");
						}
					}
				}
				echo "</table>";
	}
	
	$query->close();
	$jqm_db->close();
	
	
?>