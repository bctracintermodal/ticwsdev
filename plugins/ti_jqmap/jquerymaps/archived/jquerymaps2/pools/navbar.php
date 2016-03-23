<div id="navbar" style=" ">

	<div class='left'>
		<img width="120" src='http://www.tracintermodal.com/wp-content/themes/trac/images/trac-logo.png'>
	</div>

	<div class='right'>
	<?php

	$links = array(
		'marinepool'		=>	'Marine',
		'activedepots'		=>	'Active Pools',
		'natdompool'		=>	'National Domestic',
		'tracconnect_2014'	=>	'Start / Stop',
	);

	foreach($links as $id=>$title)
	{
		if($id==$_GET['type'])
		{
			echo "<a class='current' href='index.php?type=$id'>$title</a>";
		} else {
			echo "<a href='index.php?type=$id'>$title</a>";
		}
	}

			echo "<a href='excel.php?type=$_GET[type]'><img width='30' src='http://techsupport.foreverwarm.com/wp-content/uploads/2011/07/Excel-2003-icon.png'/></a>";
	
	
	?>
	</div>
</div>