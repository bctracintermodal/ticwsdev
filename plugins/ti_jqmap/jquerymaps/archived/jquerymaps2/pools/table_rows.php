<?php

if (mysql_num_rows($result) > 0) {
    while ($row = mysql_fetch_assoc($result)) {
        array_push($fields,$row['Field']) . '<br/>' ;
    }
}	
	
echo "<div style='height:75px;'>";
echo "</div>";
echo "<table>";
		echo ("<tr style=''>");
foreach($fields as $field)
{
	echo ("<th>$field</th>");
}	
		echo ("</tr>");
		
	$bg="#CCC";

	require_once('../wp-load.php');	
	global $wpdb;
	
	$pool_data = $wpdb->get_results( 
		"select * from " . TABLENAME . ";"
	);
	
		
	foreach ( $pool_data as $data ) 
	{
		echo ("<tr>");
		foreach($fields as $field)
		{
			$val = $data->$field;
			echo ("<td>$val</td>");
		}	
		echo ("</tr>");
	}
	echo "</table>";	
	echo ("
	<div id='footer'>
	<a href='#top'>Go To The Top</a>
	</div>
	");	
	
