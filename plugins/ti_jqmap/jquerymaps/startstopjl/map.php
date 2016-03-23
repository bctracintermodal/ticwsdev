
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