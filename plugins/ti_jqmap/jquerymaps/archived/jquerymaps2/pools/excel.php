<!DOCTYPE html>
<html>
<head>
<title>List of TRAC Locations/Pools</title>
</head>
<body id="top">
<?php

$file=$_GET['type'] . Date('mdYHis') . ".xls";
header("Content-type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename=$file");

error_reporting(E_ALL);

define('TABLENAME',$_GET['type']);	

ini_set('display_errors', 1);	
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