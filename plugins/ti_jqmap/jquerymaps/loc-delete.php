<?php
	ini_set('display_errors',1);  
	error_reporting(E_ERROR  );

	$table = "jqm_locations";
	include("ndp/jquerymaps/libs/jqmDB.php");
	$locationID = $_POST['locationID'];
	

						$sql = "delete from $table where locationID=$locationID";
						//echo "$sql";
						$jqm_db->query($sql);

?>