<!DOCTYPE html>
<html>
<head>
<title>List of TRAC Locations/Pools</title>
<link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body id="top">
<?php

require('navbar.php');

error_reporting(E_ALL);


if(!isset($_GET['type']))
{

	$links = array(
		'marinepool'		=>	'Marine',
		'activedepots'		=>	'Active Pools',
		'natdompool'		=>	'National Domestic',
		'tracconnect_2014'	=>	'Start / Stop',
	);

	
	foreach($links as $id=>$title)
	{
			$menu .= "<a href='index.php?type=$id'>$title</a><br/>";
	}


	die("
		<div id='lightbox'>
		</div>
		<div id='lightbox-menu'>
		<h2>TRAC Locations</h2>
		<h3>Select A Location Type.</h3>
		$menu
		</div>
	");
}

define('TABLENAME',$_GET['type']);	

ini_set('display_errors', 1);	
//phpinfo();
require_once('../deployment-detective/db.php');		
$con= @mysql_connect("$db_host","$db_user","$db_pass")
or die ("Cannot connect to MySql.");
$db = @mysql_select_db("$db_name",$con)
or die ("Cannot select the $db_name database.<br>Please check your details in the database connection  file and try again");
$fields = array();
$result = mysql_query("SHOW COLUMNS FROM " . TABLENAME);
if (!$result) {
    echo 'Could not run query: ' . mysql_error();
    exit;
}

require_once('table_rows.php');


?>














	
?>

</body>
</html>