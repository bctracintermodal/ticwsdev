<?php
	header("Content-Type: application/xml; charset=utf-8");
?>	
<jqm_markerCategories xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../xsd/jqm_markerCategories.xsd">
	<category id="location0" enabled="true" >
		<markerStyle event="onMouseOut" iconUrl="../images/icons/marker-black.png" scale="1" opacity="1" visible="true" />
		<action event="onMouseOver" target="infowindow" infoWindowDiv="jqm_popup" align="mouse,10,10" />
		<action event="onClick" target="js" jsFunction="jqmDisplayMarkerPopup" />
	</category>
	<category id="location1" enabled="true" >
		<markerStyle event="onMouseOut" iconUrl="../images/icons/marker-orange.png" scale="1" opacity="1" visible="true" />
		<action event="onMouseOver" target="infowindow" infoWindowDiv="jqm_popup" align="mouse,10,10" />
		<action event="onClick" target="js" jsFunction="jqmDisplayMarkerPopup" />
	</category>
	<category id="location2" enabled="true" >
		<markerStyle event="onMouseOut" iconUrl="../images/icons/marker-blue.png" scale="1" opacity="1" visible="true" />
		<action event="onMouseOver" target="infowindow" infoWindowDiv="jqm_popup" align="mouse,10,10" />
		<action event="onClick" target="js" jsFunction="jqmDisplayMarkerPopup" />
	</category>
</jqm_markerCategories>
