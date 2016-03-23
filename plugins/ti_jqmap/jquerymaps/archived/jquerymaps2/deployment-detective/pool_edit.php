<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);	
//phpinfo();


	require_once('db.php');		

	$con= @mysql_connect("$db_host","$db_user","$db_pass")
	or die ("Cannot connect to MySql.");

	$db = @mysql_select_db("$db_name",$con)
	or die ("Cannot select the $db_name database.<br>Please check your details in the database connection  file and try again");

 if(isset($_POST['ID']))	
{

	$sqlArray = array();
	$sql = "update tracconnect_2014 set ";
	foreach( $_POST as $k=>$v)
	{
		$sqlArray[] = "$k='$v'";
	}

	$sql .= implode(',',$sqlArray);
	$sql .=" where ID=" . $_POST['ID'];

	
	//echo("<P>$sql</p>");
	mysql_query($sql);
	echo "<div style='font-family:arial; font-size:14pt; padding-bottom:20px; color:green;'>This location has been saved.</div>";
}
	
	
	
	
	
	
	
$id 		= $_REQUEST['ID'];

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
						
<form method="post" action='pool_edit.php' >
<table>
<?php
		$sql = "SELECT * FROM tracconnect_2014 where ID=$id";
		$disabled = "";
		$result = mysql_query($sql) 
		or die(mysql_error());  
		while($row = mysql_fetch_array( $result )) {
			foreach($fields as $field)
			{
				$field_value = $row[$field];
				
				if($field=="ID")
				{
					$disabled = "readonly ";
					$style='background:#EEE;color:#999;';
				} else {
					$disabled = "";
					$style='background:#FFF;';
				}
				echo ("
				<tr>
				<td width='300' >$field</td><td><input style='$style' $disabled size='50' name='$field' value='$field_value'></td>
				</tr>
				");
			}
		} 
		
?>
<tr>
<td colspan="2"><input style="color:white; border-radius:10px; font-size:16pt; padding:30px 0px; width:100%; height:5px; background:#3399FF; " type="submit" value='Save'></td>
</tr>
</table>


</form>

</body>
</html>