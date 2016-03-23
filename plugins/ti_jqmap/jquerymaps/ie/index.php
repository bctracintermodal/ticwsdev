<?php
	include("jquerymaps/libs/jqmDB.php");
	
	$list_regions = "";
	
	$sql = "SELECT r.* FROM jqm_regions r WHERE region_map <> 0 ORDER BY r.regionID";
	$query = $jqm_db->query($sql);

	if ($query->num_rows > 0)
		while ($rd = $query->fetch_assoc())
			$list_regions .= "<li><a href='Javascript:jqmSetRegion(\"" . $rd['regionID'] . "\");'>" . strtoupper($rd['regionID']) . "</a></li>";
	$query->close();	
	$jqm_db->close();

?>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>jQueryMaps</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />

	<!-- For IE 8 and lower, jQueryMaps uses Google ExplorerCanvas -->
    <!--[if IE]><script>if (document.documentMode < 9) document.write("<script src='jquerymaps/libs/excanvas/excanvas_tagcanvas.js'><\/script>");</script><![endif]-->
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" ></script>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js" ></script>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
	<script type="text/javascript" src="jquerymaps/libs/map.js" ></script>
</head>

<body>
	<div class="page">
        <h2>Marine Neutral Pools</h2>
        <p>
        	TRAC Intermodal offers ten Marine Neutral Pools covering all the major freight markets in the USA. TRAC's fleet size, nationwide coverage and product offering allow it to offer customers local, regional and national solutions to the first and last mile.<br /><br />
	        View TRAC's Marine Neutral Pool Start/Stop locations by Region Pool
		</p>            
        <ul class="regions"><?php echo $list_regions; ?></ul>
        <div class="box-map">
	        <div id="jqm_loader"></div>
    	    <div id="jqm_logo"><img src="images/logo.png" alt="" /></div>
	        <div id="jqmMap"></div>
    	    <div id="jqm_popup">##label##</div>
		</div>
        <div class="box-google">
	        <a href="Javascript:jqmDisplayPopupClose();" class="button">Close</a>
            <div id="google"></div>
        </div>
  	</div>
    <div id="jqm-dialog"></div>        
</body>
</html>