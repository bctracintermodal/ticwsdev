<!DOCTYPE html>
<html>
<head>
<style>

td, th
{
	font-family:arial;
	font-size:9pt;
}


</style>

</head>
<body>
<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);	
//phpinfo();


	require_once('../deployment-detective/db.php');		

	$con= @mysql_connect("$db_host","$db_user","$db_pass")
	or die ("Cannot connect to MySql.");

	$db = @mysql_select_db("$db_name",$con)
	or die ("Cannot select the $db_name database.<br>Please check your details in the database connection  file and try again");

	echo "<table>";
		echo ("
		<tr style='background:#CCC;'>
		<td style='text-align:center; font-size:8pt;'>ID</td>
		<td style='font-size:8pt;'>Ramp</td>
		<td style='font-size:8pt;'>Location</td>
		<td style='font-size:8pt;'>Pool Type<br/>Pool Name</td>
		<td style='font-size:8pt;'>MPID<br/>MarkerID</td>
		<td style='font-size:8pt;'>Create Date<br/>Create User</td>
		<td style='font-size:8pt;'>Update Date<br/>Update User</td>
		</tr>
		");
		
		
	$bg="#CCC";

	require_once('../wp-load.php');	
	global $wpdb;
	
	$fivesdrafts = $wpdb->get_results( 
		"select * from tracconnect_2014;"
	);
	
		
	foreach ( $fivesdrafts as $fivesdraft ) 
	{
		$id = $fivesdraft->ID;
		$ramp = $fivesdraft->Ramp;
		$location = $fivesdraft->Location;
		$address = $fivesdraft->Address;
		$city = $fivesdraft->City;
		$state = $fivesdraft->State;
		$zip = $fivesdraft->Zip;
		$phone = $fivesdraft->Phone;
		$pooltype = $fivesdraft->PoolType;
		$poolname = $fivesdraft->PoolName;
		$mpid = $fivesdraft->MPID;
		$markerid = $fivesdraft->MarkerID;
		$createdate = $fivesdraft->CreateDate;
		$createuser = $fivesdraft->CreateUser;
		$updateuser = $fivesdraft->UpdateUser;
		$updatedate = $fivesdraft->UpdateDate;
		$data = array(
			'id'				=>		$id,
			'ramp'				=>		$ramp,
			'location'			=>		$location,
			'address'			=>		$address,
			'city'				=>		$city,
			'state'				=>		$state,
			'zip'				=>		$zip,
			'phone'				=>		$phone,
			'pooltype'			=>		$pooltype,
			'poolname'			=>		$poolname,
			'mpid'				=>		$mpid,
			'markerid'			=>		$markerid,
			'createuser'		=>		$createuser,
			'createdate'		=>		$createdate,
			'updateuser'		=>		$updateuser,
			'updatedate'		=>		$updatedate,
		);
		
		$data = implode('|||',$data);

		if(	$bg=="#EEE")
		{
			$bg="#CCC";
		} else {
			$bg="#EEE";
		}


		
		
		echo ("
		<tr style='background:".$bg.";'>
		<td rowspan='2' style='text-align:center;'>
		$id
		</td>
		<td>
		<label for='pool-$id'>$ramp</label>
		</td>
		<td style='font-size:8pt;'>$location</td>
		<td style='font-size:8pt;'>$pooltype<br/>$poolname</td>
		<td style='font-size:8pt;'>$mpid<br/>$markerid</td>
		<td style='font-size:8pt;'>$createdate<br/>$createuser</td>
		<td style='font-size:8pt;'>$updatedate<br/>$updateuser</td>
		</tr>
		<tr style='background:".$bg.";'>
		<td colspan='11' align='center' style='font-size:8pt;'>Contact Information: $address / $city, $state $zip / $phone</td>
		</tr>
		");
	}
	echo "</table>";	
	
	
?>

</body>
</html>