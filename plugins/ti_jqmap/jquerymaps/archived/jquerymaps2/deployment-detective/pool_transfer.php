<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);	
//phpinfo();


	require_once('db.php');		

	$con= @mysql_connect("$db_host","$db_user","$db_pass")
	or die ("Cannot connect to MySql.");

	$db = @mysql_select_db("$db_name",$con)
	or die ("Cannot select the $db_name database.<br>Please check your details in the database connection  file and try again");

$deployToServer = $_POST['deployToServer'];
$data = explode('|||',$_POST['data']);
$number_data = sizeOf($data);

$ids 		= implode(",",$_POST['id']);
$id_array	= $_POST['id'];


$servers = array( 
'Production'=>array('http://prodtracweb1.tracintermodal.com/','http://prodtracweb2.tracintermodal.com/'),
'QA'		=>array('http://qatracweb1.tracintermodal.com/','http://qatracweb2.tracintermodal.com/'),
'dev'		=>array('http://devtracweb01.tracintermodal.com/','http://devtracweb02.tracintermodal.com/'),
'dev1'		=>array('http://devtracweb01.tracintermodal.com/'),
'dev2'		=>array('http://devtracweb02.tracintermodal.com/'),
'Research2'	=>array('http://rdtracweb02.tracintermodal.com/'),
'staging'	=>array('http://10.75.84.181/'),
'UAT'		=>array('http://uattracweb.tracintermodal.com/'),
'all'		=>array('http://uattracweb.tracintermodal.com/','http://prodtracweb1.tracintermodal.com/','http://prodtracweb2.tracintermodal.com/','http://qatracweb1.tracintermodal.com/','http://qatracweb2.tracintermodal.com/','http://devtracweb01.tracintermodal.com/','http://devtracweb02.tracintermodal.com/','http://rdtracweb02.tracintermodal.com/'),
);

$deploy_url = implode(',',$servers[$deployToServer]);
echo ("<p>$ids will be deployed to <a target='_blank' href='$deployToServer'>$deploy_url</a></p>");

?>

<input type='button' value='Back' id='btn-back'	onclick='javascript:window.history.go(-1);' class='btnMainButtons' />

<?php

$fields = array(
	'ID',
	'Ramp',
	'Location',
	'Address',
	'City',
	'State',
	'Zip',
	'Phone',
	'PoolType',
	'PoolName',
	'MPID',
	'MarkerID',
	'CreateUser',
	'CreateDate',
	'UpdateUser',
	'UpdateDate',
);



?>

<html>

<body>


<?php

ini_set('display_errors',0);  
error_reporting(E_ALL);


$width_col1 		=	"100";
$width_col2 		=	"700";
$deployedFrom 		=	$_SERVER['HTTP_ORIGIN'];
$deployTo 			=	$_SERVER['HTTP_ORIGIN'];
?>
						

<?php

foreach($id_array as $each_id)
{


//					if(DEPLOY)
//					{
						?>
						<form style='display:none;' method="post" target="pool_info" action='<?php echo $deploy_url;?>deployment-detective/pool_transfer_save.php' >
						<table style='display:block;'>
						<?php
						for($d=0; $d<$number_data; $d++)
						{
							$field =	$fields[$d];
							$val	=	$data[$d];
							echo "<tr><td>$field</td><td><input size='100' name='$field' value='$val' /></td></tr>\n";

						}
						?>								
						</table>
						<input type='submit'>
						</form>

						<?php

						foreach($servers[$_POST['deployToServer']] as $server)
						{
							$sql = "SELECT * FROM tracconnect_2014 where ID=$each_id";

							// Get all the data from the "example" table
							$result = mysql_query($sql) 
							or die(mysql_error());  

							echo "<h3>Deploying ID $each_id to server: $server</h3>";
							$data = array();

							while($row = mysql_fetch_array( $result )) {
								foreach($fields as $field)
								{
									$data[$field] = $row[$field];
									echo "$field = " . $row[$field] . '<br/>';
								}
							} 
							
							$ch = curl_init();
							$url = $server . "deployment-detective/pool_transfer_save.php";
							//echo "$url<br/>";
							curl_setopt($ch, CURLOPT_URL, $url);
							curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
							curl_setopt($ch, CURLOPT_POST, true);
							curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
							$output = curl_exec($ch);
							$info = curl_getinfo($ch);
							curl_close($ch);
						}
//					}

}
	
echo "Deployment Complete<p/>";
	
?>

</body>
</html>