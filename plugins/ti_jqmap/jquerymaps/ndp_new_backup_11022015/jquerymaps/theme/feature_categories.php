<?php


	include("../libs/jqmDB.php");
	
	$settings = array('ndp_background_color'=>'#DDD','ndp_state_border_color'=>'#333');

	foreach($settings as $setting_name=>$setting_value)
	{
		$sql = "SELECT option_value FROM tracintermodal.trac_options where option_name='$setting_name' ";
		$query = $jqm_db->query($sql);
		if ($query->num_rows > 0)
		{
			while ($rd = $query->fetch_assoc())
			{
				$settings[$setting_name] = $rd['option_value'];
			}
		}
	}
	

	$jqm_db->close();

echo ('
<jqm_featureCategories xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../xsd/jqm_featureCategories.xsd">
	<category id="region" enabled="true" zoom="true" >
		<action event="onMouseOver" target="infowindow" align="mouse,10,10" />
		<action event="onClick" target="js" jsFunction="jqmSetRegionMap" />
	</category>
	<category id="region_none" enabled="false" zoom="false" >
		<style event="onMouseOut" fillColor="#ccc" strokeColor="#fff" strokeWidth="1" />
	</category>
	<category id="state" enabled="false" zoom="false" >
		<style event="onMouseOut" fillColor="'.$settings['ndp_background_color'].'" strokeColor="'.$settings['ndp_state_border_color'].' " strokeWidth="1" />
		<style event="onMouseOver" fillColor="#ff0000" strokeColor="pinks" strokeWidth="1" />
	</category>
</jqm_featureCategories>
');