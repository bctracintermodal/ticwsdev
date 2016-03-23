<?php



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

	require_once('../wp-load.php');

	$host = "localhost";
	$db   = "jquerymaps";
	$user = DB_USER;
	$pass = DB_PASSWORD;
	
	$jqm_db = new mysqli($host, $user, $pass, $db);
	if ($jqm_db->connect_errno) { echo "Error MySQL: (" . $jqm_db->connect_errno . ") " . $jqm_db->connect_error; }
	
	$jqm_db->set_charset("utf8");	
	
	unset($_SESSION['loggedin']);

	
	$states = ('
	
	<select name="state">
	<option value="none">Select A State</option>
	<option value="AL">Alabama</option>
	<option value="AK">Alaska</option>
	<option value="AZ">Arizona</option>
	<option value="AR">Arkansas</option>
	<option value="CA">California</option>
	<option value="CO">Colorado</option>
	<option value="CT">Connecticut</option>
	<option value="DE">Delaware</option>
	<option value="DC">District Of Columbia</option>
	<option value="FL">Florida</option>
	<option value="GA">Georgia</option>
	<option value="HI">Hawaii</option>
	<option value="ID">Idaho</option>
	<option value="IL">Illinois</option>
	<option value="IN">Indiana</option>
	<option value="IA">Iowa</option>
	<option value="KS">Kansas</option>
	<option value="KY">Kentucky</option>
	<option value="LA">Louisiana</option>
	<option value="ME">Maine</option>
	<option value="MD">Maryland</option>
	<option value="MA">Massachusetts</option>
	<option value="MI">Michigan</option>
	<option value="MN">Minnesota</option>
	<option value="MS">Mississippi</option>
	<option value="MO">Missouri</option>
	<option value="MT">Montana</option>
	<option value="NE">Nebraska</option>
	<option value="NV">Nevada</option>
	<option value="NH">New Hampshire</option>
	<option value="NJ">New Jersey</option>
	<option value="NM">New Mexico</option>
	<option value="NY">New York</option>
	<option value="NC">North Carolina</option>
	<option value="ND">North Dakota</option>
	<option value="OH">Ohio</option>
	<option value="OK">Oklahoma</option>
	<option value="OR">Oregon</option>
	<option value="PA">Pennsylvania</option>
	<option value="RI">Rhode Island</option>
	<option value="SC">South Carolina</option>
	<option value="SD">South Dakota</option>
	<option value="TN">Tennessee</option>
	<option value="TX">Texas</option>
	<option value="UT">Utah</option>
	<option value="VT">Vermont</option>
	<option value="VA">Virginia</option>
	<option value="WA">Washington</option>
	<option value="WV">West Virginia</option>
	<option value="WI">Wisconsin</option>
	<option value="WY">Wyoming</option>
</select>

');		
	
	
	
	
	
	
	
?>

<!DOCTYPE html>
<html>
<head>

<style>

BODY
{
	margin:0px;
}

#add-new-row input
{
	background:#EFE;
	border-radius:5px;
	border:1px solid #AAA;
	padding:7px;
	color:green;
}

#btn-add
{
	background:#090 !important;
	color:white !important;
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


.buttons{
	background:green; color:white; margin-bottom:5px; border: 1px solid #000; border-radius:3px;width:50px;
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script>

$(document).ready(function(){

	$('.loc-rows').click(function()
	{
		id = $(this).attr('id');
		$('#add-new-row').css('background','lime');
		id = id.replace('row-','');
		$('#mode').val('U')
		$('#new_loc_id').val(id)
		$('#btn-add').val('Update');
		$("html, body").animate({ scrollTop: 0 }, "slow");		
		//alert(id);
	}
	);
	
	$('.btn-delete').click(function(e){
		id=$(this).attr('id');
		id=id.replace('btnDelete','');
		e.preventDefault();
		//console.log('Delete: ' + id);

		delete_loc = confirm("Do you want to delete this location?");

		if(delete_loc==true)
		{
			$.ajax({
			  method: "POST",
			  url: "loc-delete.php",
			  data: { locationID: id }
			})
			  .done(function( msg ) {
				$('#row-' + id).fadeOut();
				//alert(msg);
			  });
		} else {
				//alert("Location was not deleted.");
		}
		
		
	});

	$('#btn-add').click(function(e)
	{
		e.preventDefault();
		mode = $('#mode').val()
		submit_form = true;
		
		if(mode!='U')
		{
			$( ".required-data" ).each(function( index ) {
			  data = $(this).val();
			  if(data=='')
			  {
				$(this).css('border','red 1px solid');
				submit_form = false;
			  }
			});		
		}
		
		if(submit_form==true)
		{
			$('#data-form').submit();
		}
	}
	);

	
});
</script>

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

	if(isset($_POST['new_loc_id']))
	{
		if($_POST['mode']=="U")
		{
		
			foreach($_POST as $k=>$v)
			{
				if($_POST[$k]!="")
				{
					if( ($k=="state" && $_POST[$k]!='none') || ($k!='state')   )
					{
						$new_val = trim($_POST[$k]);
						$sql = "update $table set $k='$new_val' where locationID=$_POST[new_loc_id]";
						//echo "$sql<br/>";
						$jqm_db->query($sql);
					}
				}
			}
			//echo "<hr/>";
		} else {
			$sql = "insert into $table (locationID,regionID,is_tpcp,location,metro_city,address,city,state,zip,Phone,lat,lon) values ($_POST[new_loc_id],'$_POST[regionID]','$_POST[is_tpcp]','$_POST[location]','$_POST[metro_city]','$_POST[address]','$_POST[city]','$_POST[state]','$_POST[zip]','$_POST[phone]','$_POST[lat]','$_POST[lon]') ";
			//echo "$sql<hr/>";
			$jqm_db->query($sql);
		}
		echo "<div id='success-bar'>This location has been successfully added.</div>";
	}


	
	
	if(isset($_POST['id']))
	{
		$sql = "update $table set regionID='$_POST[regionID]', is_tpcp='$_POST[is_tpcp]' where locationID=$_POST[id]";
		//echo "$sql<hr/>";
		echo "<div id='success-bar'>This location has been successfully edited.</div>";
		$jqm_db->query($sql);
	}

		$sql = " SELECT max(locationID)+1 as new_loc_id FROM $table  ";
		//echo $sql;
		$query = $jqm_db->query($sql);
		while ($rd = $query->fetch_assoc()) {
			$new_loc_id		= $rd['new_loc_id'];
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
			<th></th>
			<th><a style='$css_pool_link' href='?o=p'>POOL</a></th>
			<th><a style='$css_pool_link' >TPCP</a></th>
			<th><a style='$css_id_link' href='?o=i'>ID #</a></th>
			<th><a style='$css_metrocity_link' href='?o=m'>Metro City</a></th>
			<th><a style='$css_loc_link' href='?o=l'>Location/Ramp</a></th>
			<th>Address</th>
			<th><a style='$css_city_link' href='?o=c'>City</a></th>
			<th><a style='$css_state_link' href='?o=s'>State</a></th>
			<th><a style='$css_zip_link' href='?o=z'>Zip</a></th>
			<th><a style='$css_zip_link' >Phone</a></th>
			<th><a style='$css_zip_link' >Lat</a></th>
			<th><a style='$css_zip_link' >Lon</a></th>
		</tr>


						<tr id='add-new-row'>
							<form id='data-form' method='post' >
							<td>
							<input type='Submit' value='Add' id='btn-add' class='buttons' style='' />
							</td>
							<td><input name='regionID' size='3' /></td>
							<td align='center'><input type='checkbox' name='is_tpcp' /></td>
							<td>
							<input size='1' name='mode' type='hidden' id='mode' />
							<input size='1' id='new_loc_id' name='new_loc_id' readonly style='color:#999; background:#CCC;' value='$new_loc_id' />
							</td>
							<td><input size='25' class='required-data' name='metro_city'></td>
							<td><input size='35' class='required-data' name='location'></td>
							<td><input size='40' class='required-data' name='address'></td>
							<td><input size='10' class='required-data' name='city'></td>
							<td>$states</td>
							<td><input size='5' class='required-data' name='zip'></td>
							<td><input size='5' class='required-data' name='phone'></td>
							<td><input size='5' class='required-data' name='lat'></td>
							<td><input size='5' class='required-data' name='lon'></td>
							</form>
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
					$is_tpcp		= $rd['is_tpcp'];
					$phone			= $rd['Phone'];
					$lat			= $rd['lat'];
					$lon			= $rd['lon'];
					if($is_tpcp)
					{
						$checked="checked";
					} else {
						$checked="";
					}
					
					echo ("
						<tr id='row-$id' class='loc-rows'>
							<form method='post'>
							<td>
							<input name='id' type='hidden' value='$id'/>
							<input type='submit' value='Delete' id='btnDelete$id' class='btn-delete buttons' style='' />
							</td>
							<td><input name='regionID' size='3' value='$regionID'/></td>

							<td align='center'><input $checked type='checkbox' name='is_tpcp' /></td>
							<td>$id</td>
							<td>$metro_city</td>
							<td>$location</td>
							<td>$address</td>
							<td>$city</td>
							<td>$state</td>
							<td>$zip</td>
							<td>$phone</td>
							<td>$lat</td>
							<td>$lon</td>
							</form>
						</tr>
					");

					
			}
		
	
	
	
?>

</table>
</body>
</html>