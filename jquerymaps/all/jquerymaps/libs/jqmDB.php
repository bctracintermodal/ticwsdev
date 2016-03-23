<?php
	$host = "127.0.0.1";
	$db   = "wp_tibeta";
	$user = "tibeta";
	$pass = "wdc0MG1VVefUsgrlvJXU";
	
	$jqm_db = new mysqli($host, $user, $pass, $db);
	if ($jqm_db->connect_errno) { echo "Error MySQL: (" . $jqm_db->connect_errno . ") " . $jqm_db->connect_error; }
	
	$jqm_db->set_charset("utf8");
?>