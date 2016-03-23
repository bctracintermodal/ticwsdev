<?php
	$host = "localhost";
	$db   = "jquerymaps";
	$user = "root";
	$pass = "tracintermodal";
	
	$jqm_db = new mysqli($host, $user, $pass, $db);
	if ($jqm_db->connect_errno) { echo "Error MySQL: (" . $jqm_db->connect_errno . ") " . $jqm_db->connect_error; }
	
	$jqm_db->set_charset("utf8");
?>