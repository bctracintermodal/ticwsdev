<!DOCTYPE html>

<html lang="en" >
<head> 
	<title>TRAC Intermodal jQueryMaps Business Category Map</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="css/main.css">
    
	
	<!-- For IE 8 and lower, jQueryMaps uses Google ExplorerCanvas -->
    <!--[if IE]><script>if (document.documentMode < 9) document.write("<script src='jquerymaps/libs/excanvas/excanvas_tagcanvas.js'><\/script>");</script><![endif]-->
	<!-- jQuery and jQuery-UI libraries are needed by jQueryMaps -->
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" ></script>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js" ></script>
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="https://www.youtube.com/player_api"></script>

	<!-- This library contains everything directly related to the map -->
	<script type="text/javascript" src="jquerymaps/libs/jqmMapMgmt.js" ></script>

	<!-- These libraries are not needed by jQueryMaps, but used in this evaluation pack -->
    <script type="text/javascript" src="jquerymaps/libs/chart.js"></script>


	
</head>

<body >

	<!-- The page header, not needed by jQueryMaps -->
	<div id="header">
    	<div class="page">
           	<div class="logo">
				
			</div>
            <div class="tools">
            	<ul id="menu">
                </ul>
            </div>
		</div>
    </div>

        
            <div style="background:white;">
				<div class="top" style=" width:100%; min-height:50px; overflow:hidden; margin-bottom:20px; color:white; position:fixed;top:0;z-index:100; ">
					<div style=' float:left; width:12%; padding-top:10px; padding-left:10px; height:50px; '>
						<h3 style="color:white; ">Zoom</h3>
						<div class="btn-section">
							<a href='Javascript:jqmMap.zoomIn();' title="Zoom In"><img src='jquerymaps/images/toolbars/Zoom_In_Icon_32.png'/></a>
							<a href='Javascript:jqmMap.zoomOut();' title="Zoom Out"><img src='jquerymaps/images/toolbars/Zoom_Out_Icon_32.png'/></a>
							<a href='Javascript:jqmDisplayInitialView();' title="Reset Zoom"><img src='jquerymaps/images/toolbars/Zoom_Icon_32.png'/></a>
						</div>
					</div>

					<div style=' float:left; width:12%; padding-top:10px; padding-left:10px; min-height:50px; '>
						<h3 style="color:#3399FF; ">All Markers</h3>
						<div class="btn-section">
						<a id="hideAllMarkers" href='Javascript:jqmShowOrHideMarkersRange("hideAll");' class="enable" title="Hide All Markers" label="Hide All Markers" >Hide All</a>
						|
						<a id="showAllMarkers" href='Javascript:jqmShowOrHideMarkersRange("showAll");' class="enable" title="Show All Markers" label="Show All Markers" >Show All</a>
						</div>
					</div>


					<div style=' float:left; width:12%; padding-top:10px; padding-left:10px; height:50px; '>
						<h3 style="color:#3399FF; ">All Marine Pools</h3>
						<div class="btn-section">
							<a id="all_marine_pools" href='Javascript:jqmShowOrHideMarkersRange("hide_all_marine_pools");' class="enable" title="Hide All Marine Pools" label="All Marine Pools" >Hide All</a>
							|
							<a id="all_marine_pools" href='Javascript:jqmShowOrHideMarkersRange("show_all_marine_pools");' class="enable" title="Show All Marine Pools" label="All Marine Pools" >Show All</a>
						</div>
					</div>

					
					<div style=' float:left; width:55%; padding-top:10px; padding-left:10px; height:50px; '>
						<h3 style="color:#3399FF; ">All Marine Pools <div id='scalefactor'></div></h3>
						<div class="btn-section">
							<img width='23' src="jquerymaps/images/icons/icon_neutral.png" />
							<a id="category_marine_pool_neutral" href='Javascript:jqmShowOrHideMarkersRange("marine_pool_neutral");' class="enable" 
							title="Hide/show this category" label="TRAC Neutral Pools" >
							TRAC Neutral Pools
							</a>
							|
							<img width='23' src="jquerymaps/images/icons/icon_private.png" />
							<a id="category_marine_pool_private" href='Javascript:jqmShowOrHideMarkersRange("marine_pool_private");' 
								class="enable" title="Hide/show this category" label="TRAC Private Pools" >
								TRAC Private Pools
							</a>
							|
							<img width='23' src="jquerymaps/images/icons/icon_coop.png" />
							<a id="category_marine_pool_coop" href='Javascript:jqmShowOrHideMarkersRange("marine_pool_coop");' class="enable" title="Hide/show this category" label="Co-op Pools" >
								Co-op Pools
							</a>
							|
							<img width='23' src="jquerymaps/images/icons/icon_depots.png" />
							<a id="category_depots_term_lease" href='Javascript:jqmShowOrHideMarkersRange("depots_term_lease");' class="disable" title="Hide/show this category" label="Depots for Term Lease" >
							Depots for Term Lease
							</a>
							|
							<img width='23' src="jquerymaps/images/icons/icon_domestic.png" />
							<a id="category_domestic_pool" href='Javascript:jqmShowOrHideMarkersRange("domestic_pool");' class="enable" title="Hide/show this category" label="Domestic Pool Facilities" >
							Domestic Pool Facilities
							</a>
							
							
					</div>

					
				</div>
				</div>

				<div style='clear:both;'></div>
								
				
|
					
		
                <div class="cnt"  style=" width:100%; min-height:200px; ">
                
                    <!-- Map loading animation -->
                    <div id="jqm_loader" class="jqm_loader"></div>
                    
                    <!-- The map will be created inside this DIV element -->
                    <div id="jqm_map" style=" z-index:50; margin:0px auto; "></div>
                    
                    <!-- This DIV element pops up when you hover over an area or marker -->
			        <div id="jqm_popup" class="jqm_popup">
						<div class="title" style="">Current Market:</div>
						<div class="popup" style="">##label##</div>
					</div>
			        <!--<div id="jqm_popup" class="jqm_popup"><div class="title">##label##</div><div class="popup">##popup##</div></div>-->

					<!-- This DIV element pops up when you click on an area -->
                    <div id="jqm_dialog" title="">
                    	<div id="jqm_box_dialog" class="jqm_box_dialog"></div>
                    	<canvas id="jqm_box_canvas" class="jqm_box_dialog"></canvas>
                        <div id="ytplayer"></div>
					</div>
                </div>
</div>
</div>
</div>
</div>



</body>
</html>