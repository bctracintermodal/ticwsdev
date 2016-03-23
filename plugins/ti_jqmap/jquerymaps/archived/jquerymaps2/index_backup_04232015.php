<!DOCTYPE html>

<html lang="en">
<head>
	<title>Trac Intermodal jQueryMaps Business Category Map</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="last-modified" content="Sat, 14 Sep 2013 08:00:00 GMT" />
    <meta name="description" content="High-end, jQuery-based, interactive maps: NBA Teams, US maps, OpenStreeMap and many other jQuery-based interactive map solutions." />
    <meta name="keywords" content="jquerymaps, jquery maps, interactive maps, dynamic maps, world map, us map, zip code map, election map, state map, county map, mall map, web map, mapping solutions, custom map, location map, territory map, area map" />
    <meta name="copyright" content="Copyright &copy; 2004-2013 jQueryMaps" />
    <meta name="robots" content="index,follow" />
    <meta name="robots" content="all" />
    <meta name="language" content="en" />
	<link type="image/x-icon" href="http://www.jquerymaps.com/favicon.ico" rel="icon" />
	<link type="image/x-icon" href="http://www.jquerymaps.com/favicon.ico" rel="shortcut icon" />     
    <link rel="stylesheet" type="text/css" href="css/main.css">
    
	<!-- For IE 8 and lower, jQueryMaps uses Google ExplorerCanvas -->
    <!--[if IE]><script>if (document.documentMode < 9) document.write("<script src='jquerymaps/libs/excanvas/excanvas_tagcanvas.js'><\/script>");</script><![endif]-->

	<!-- jQuery and jQuery-UI libraries are needed by jQueryMaps -->
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" ></script>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="https://www.youtube.com/player_api"></script>

	<!-- This library contains everything directly related to the map -->
	<script type="text/javascript" src="jquerymaps/libs/jqmMapMgmt.js" ></script>

	<!-- These libraries are not needed by jQueryMaps, but used in this evaluation pack -->
    <script type="text/javascript" src="jquerymaps/libs/chart.js"></script>
</head>

<body>
	<!-- The page header, not needed by jQueryMaps -->
	<div id="header">
    	<div class="page">
           	<div class="logo"><a href="http://www.jquerymaps.com" target="_self">
			<img src="images/logo.png" title="jQueryMaps" width="100"  />
			</a></div>
            <div class="tools">
            	<ul id="menu">
                </ul>
            </div>
		</div>
    </div>

        
            <div style="background:white;">
            	<div class="top"><h2 >TRAC Interactive Maps</h2></div>
				
							

                                <div id="category_icon_city_4" class="marker"><img src="jquerymaps/images/icons/blue_circle.png" /></div><a id="category_marine_pool_neutral" href='Javascript:jqmShowOrHideMarkersRange("marine_pool_neutral");' class="enable" title="Hide/show this category" label="TRAC Marine Neutral Pools" >TRAC Marine Neutral Pools</a>
                                <div id="category_icon_city_2" class="marker"><img src="jquerymaps/images/icons/navy_circle.png" /></div><a id="category_marine_pool_private" href='Javascript:jqmShowOrHideMarkersRange("marine_pool_private");' class="enable" title="Hide/show this category" label="TRAC Private Pools" >TRAC Private Pools</a>
                                <div id="category_icon_city_2" class="marker"><img src="jquerymaps/images/icons/grey_circle.png" /></div><a id="category_marine_pool_coop" href='Javascript:jqmShowOrHideMarkersRange("marine_pool_coop");' class="enable" title="Hide/show this category" label="Co-op Pools" >TRAC’s contribution to Co-op Pools </a>
                                <div id="category_icon_city_3" class="marker"><img src="jquerymaps/images/icons/red_square.png" /></div><a id="category_domestic_pool" href='Javascript:jqmShowOrHideMarkersRange("domestic_pool");' class="enable" title="Hide/show this category" label="Domestic Pool Facilities" >Domestic Pool Facilities</a>
                                <div id="category_icon_city_2" class="marker"><img src="jquerymaps/images/icons/lime_triangle.png" /></div><a id="category_depots_term_lease" href='Javascript:jqmShowOrHideMarkersRange("depots_term_lease");' class="enable" title="Hide/show this category" label="Depots for Term Lease" >Depots for Term Lease</a>
								
								
								
				
				
                <div class="cnt">
                
                    <!-- Map loading animation -->
                    <div id="jqm_loader" class="jqm_loader"></div>
                    
                    <!-- The map will be created inside this DIV element -->
                    <div id="jqm_map"></div>
                    
                    <!-- This DIV element pops up when you hover over an area or marker -->
			        <div id="jqm_popup" class="jqm_popup"><div class="title">##label##</div><div class="popup">##popup##</div></div>

					<!-- This DIV element pops up when you click on an area -->
                    <div id="jqm_dialog" title="">
                    	<div id="jqm_box_dialog" class="jqm_box_dialog"></div>
                    	<canvas id="jqm_box_canvas" class="jqm_box_dialog"></canvas>
                        <div id="ytplayer"></div>
					</div>
                </div>
            </div>


            
            <div class="box span_9" style="display:none;">
            	<div class="top">
				<h3>Tools
				<a style="color:red; font-size:9pt; " href='Javascript:print();' title="Print Map">Print Map</a>
				</h3></div>
				<div class="cnt">
					<div class="span_2">
                    	<h3><a id="f_feature_icon" href="Javascript:toogleBox('f_feature');" class="more icon function" title="Feature Functions">Feature Functions</a></h3>
                        <div id="f_feature" class="flist hide">
                            <ul class="box_tools">
                                <li>Highlight Functionality</li>
                                <li><a href='Javascript:jqmMap.highlightFeature("us_fl");' title="Highlight Florida">Florida</a></li>
								<li><a href='Javascript:jqmMap.highlightFeature("us_mi");' title="Highlight Michigan">Michigan</a></li>
                                <li><a href='Javascript:jqmMap.unhighlightFeatures();jqmMap.redraw();' title="Unhighlight All">Unhighlight All</a></li>
								<div style="padding:5px 0px;"></div>
								
                                <li>Scaling Functionality</li>
                                <li><a href='Javascript:jqmScaleFeature("us_ks","1.5");' title="Scale Kansas x1.5">Scale Kansas x1.5</a></li> 
								<li><a href='Javascript:jqmScaleFeature("us_or","2");' title="Scale Oregon x2">Oregon x2</a></li>
								<li><a href='Javascript:jqmScaleFeature("us_ny","5");' title="Scale Oregon x2">NY x5</a></li>
								
								
                                <li><a href='Javascript:jqmUnscaleFeatures();' title="Unscale All">Unscale All</a></li>
				                <!-- The map legend to show/hide each range -->
								
								<div style="display:none;">
									<li>Show/Hide Ranges</li>
									<li><div id="feature_icon_1" class="boxlegend" style="background: #FEFBDA" color="#FEFBDA"></div><a id="feature_1" href='Javascript:jqmShowOrHideFeaturesRange("1", "state");' class="enable" title="Click to show/hide this category" label="&lt;1" >Hide &lt;1</a></li>
									<li><div id="feature_icon_2" class="boxlegend" style="background: #FDF15B" color="#FDF15B"></div><a id="feature_2" href='Javascript:jqmShowOrHideFeaturesRange("2", "state");' class="enable" title="Click to show/hide this category" label="1-2" >Hide 1-2</a></li>
									<li><div id="feature_icon_3" class="boxlegend" style="background: #FBCB0D" color="#FBCB0D"></div><a id="feature_3" href='Javascript:jqmShowOrHideFeaturesRange("3", "state");' class="enable" title="Click to show/hide this category" label="2-4" >Hide 2-4</a></li>
									<li><div id="feature_icon_4" class="boxlegend" style="background: #F27621" color="#F27621"></div><a id="feature_4" href='Javascript:jqmShowOrHideFeaturesRange("4", "state");' class="enable" title="Click to show/hide this category" label="4-8" >Hide 4-8</a></li>
									<li><div id="feature_icon_5" class="boxlegend" style="background: #F93013" color="#F93013"></div><a id="feature_5" href='Javascript:jqmShowOrHideFeaturesRange("5", "state");' class="enable" title="Click to show/hide this category" label="8-16" >Hide 8-16</a></li>
									<li><div id="feature_icon_6" class="boxlegend" style="background: #B61014" color="#B61014"></div><a id="feature_6" href='Javascript:jqmShowOrHideFeaturesRange("6", "state");' class="enable" title="Click to show/hide this category" label="&gt;16" >Hide &gt;16</a></li>
								</div>
                            </ul>
                        </div>
                        <br />
						
						
                        <h3><a id='f_marker_icon' href="Javascript:toogleBox('f_marker');" class="more icon function" title="Marker Functions">Interactive Maps</a></h3>
                        <div id='f_marker' class='flist hide' style="display:block;">
                        </div>
                  	</div>
                    <div class='span_2 last'>
                    	<h3><a id='f_zoom_icon' href="Javascript:toogleBox('f_zoom');" class="more icon function" title="Zoom Functions">Zooming</a></h3>
                        <div id='f_zoom' class='flist hide'>
                            <ul class="box_tools">

                                <li>Locations</li>
                                <li><a href='Javascript:jqmFocusOnPoint(2141, 34.0522222, -118.2427778, 5000000);' title="Zoom in on Los Angeles, CA">Zoom in on Los Angeles, CA</a></li>
                                <li><a href='Javascript:jqmMap.clickOnFeature("us_tx");' title="Zoom in on Texas">Texas</a></li>
                                <li><a href='Javascript:jqmMap.clickOnFeature("us_ny");' title="Zoom in on New York">New York</a></li>

								<div style="padding:5px 0px;"></div>
                                <li>The Entire Map</li>
                                <li><a href='Javascript:jqmMap.zoomIn();' title="Zoom In">Zoom In</a></li>
                                <li><a href='Javascript:jqmMap.zoomOut();' title="Zoom Out">Zoom Out</a></li>
                                <li><a href='Javascript:jqmMap.zoomScaleFactor(0.4);' title="Zoom by Scale Factor (x4)">Zoom by Scale Factor (x4)</a></li>
                                <li><a href='Javascript:jqmDisplayInitialView();' title="Display Initial View">Display Initial View</a></li>
                            </ul>
                        </div>
						
                        <br />
					</div>
				</div>
			</div>
            


			</div>
        </div>
    
    
	</div>
</body>
</html>