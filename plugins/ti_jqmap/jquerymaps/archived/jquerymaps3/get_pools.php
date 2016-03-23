<?php

	header("location:http://cws.tracintermodal.com/jquerymaps/ndp/get_pools.php");

	//session_start();
	
		if(isset($_GET['logout']) )
		{
		
			session_destroy();
		
			die("
				<form method='post' action='get_pools.php'>
				Username <input name='username'/><br/>
				Password <input type='password' name='password'/><br/>
				<input type='submit' value='Log In'/>
				</form>
				");
		}
		
	
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

BODY
{
	margin:0px;
}

#success-bar, #admin-bar
{
	background:green;
	width:100%;
	height:16pt;
	padding:20px 0px;
	margin-bottom:20px;
	box-shadow:3px 3px 23px #99DD99;
	color:#FFF;
	font-family:arial;
}

#admin-bar
{
	background:black;
	text-align:right;
}

#admin-bar a
{
	color:yellow;
}



td,th{
	font-family:arial;
	font-size:9pt;
}
tr#headings
{
			background-color:#999;
			color:#FFF;
			padding:10px 0px;
}
th
{
			padding:10px 10px;
}
th a
{
			color:#CFC;
}
th a:hover
{
			color:#5F5;
}
tr:hover
{
	color:#080;
}

tr:nth-child(even) {background: #EEE}
tr:nth-child(odd) {background: #DDD}



</style>

</head>

<body>

<?php

	if( isset($_POST['username']) && $_POST['username']=='jqmadmin' && $_POST['password']=='jqm2015' )
	{
		$_SESSION['loggedin']=true;
	}
	
	if(isset($_SESSION['loggedin']) && $_SESSION['loggedin']!=true)
	{
	
		die ("
				<form method='post'>
				Username <input name='username'/><br/>
				Password <input type='password' name='password'/><br/>
				<input type='submit' value='Log In'/>
				</form>
		");
	
	} else {
		echo "<div id='admin-bar'><a href='?logout'>Log Out</a></div>";
	}

	if(isset($_POST['id']))
	{
		$sql = "update $table set regionID='$_POST[regionID]', is_tpcp='$_POST[is_tpcp]' where locationID=$_POST[id]";
		//echo "$sql<hr/>";
		echo "<div id='success-bar'>This location has been successfully edited.</div>";
		$jqm_db->query($sql);
	}


?>

<table>

<?php

$css_pool_link = '';
$css_loc_link = '';
$css_state_link = '';
$css_city_link = '';
$css_id_link = '';
$css_zip_link = '';
$css_metrocity_link = '';

		switch($_GET['o'])
		{
			case 'p':
			$order = 'regionID';
			$css_pool_link = 'color:lime; text-decoration:none; font-size:135%;';
			break;
			case 'l':
			$order = 'location';
			$css_loc_link = 'color:lime; text-decoration:none; font-size:135%;';
			break;
			case 's':
			$order = 'state,city,address';
			$css_state_link = 'color:lime; text-decoration:none; font-size:135%;';
			break;
			case 'c':
			$order = 'city,address';
			$css_city_link = 'color:lime; text-decoration:none; font-size:135%;';
			break;
			case 'i':
			$order = 'locationID';
			$css_id_link = 'color:lime; text-decoration:none; font-size:135%;';
			break;
			case 'z':
			$order = 'zip,address';
			$css_zip_link = 'color:lime; text-decoration:none; font-size:135%;';
			break;
			default:
			$order = 'metro_city';
			$css_metrocity_link = 'color:lime; text-decoration:none; font-size:135%;';
		}

	echo "<table id='main-table'>";
	echo ("
		<tr id='headings'>
			<th><a style='$css_pool_link' href='?o=p'>POOL</a></th>
			<th><a style='$css_pool_link' >TPCP</a></th>
			<th><a style='$css_id_link' href='?o=i'>ID #</a></th>
			<th><a style='$css_metrocity_link' href='?o=m'>Metro City</a></th>
			<th><a style='$css_loc_link' href='?o=l'>Location/Ramp</a></th>
			<th>Address</th>
			<th><a style='$css_city_link' href='?o=c'>City</a></th>
			<th><a style='$css_state_link' href='?o=s'>State</a></th>
			<th><a style='$css_zip_link' href='?o=z'>Zip</a></th>
		</tr>
	");

	
		$sql = " SELECT a.*  FROM $table a where 1 order by $order ";
		
		$query = $jqm_db->query($sql);
		
		$not_found 	= 0;
		$found  	= 0;
			
			while ($rd = $query->fetch_assoc()) {

					$id 			= $rd['locationID'];
					$location 		= $rd['location'];
					$address 		= $rd['address'];
					$metro_city 	= $rd['metro_city'];
					$city 			= $rd['city'];
					$state 			= $rd['state'];
					$zip 			= $rd['zip'];
					$regionID		= $rd['regionID'];
					$is_tpcp			= $rd['is_tpcp'];
					if($is_tpcp)
					{
						$checked="checked";
					} else {
						$checked="";
					}
					
					echo ("
						<tr>
							<form method='post'>
							<td>
							<input name='id' type='hidden' value='$id'/>
							<input name='regionID' size='3' value='$regionID'/>
							<input type='Submit' value='Save' style='background:green; color:white; border: 1px solid #000; border-radius:3px;' />
							</td>
							<td align='center'><input $checked type='checkbox' name='is_tpcp' /></td>
							<td>$id</td>
							<td>$metro_city</td>
							<td>$location</td>
							<td>$address</td>
							<td>$city</td>
							<td>$state</td>
							<td>$zip</td>
							</form>
						</tr>
					");

					
			}
		
	
	
	
?>

</table>
</body>
</html>