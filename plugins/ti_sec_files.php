<?php

error_reporting(E_ALL);
ini_set("error_reporting", E_ALL);  

/**
 * Plugin Name: TRAC Intermodal SEC File Management
 * Description: Manage the SEC Files and XBRL Pages
 * Version: 03142016-1532
 * Author: Bruce Chamoff
 */


// Action Hooks
	add_action(	'admin_menu', 'sec_files');
	
function sec_files()
{
	add_menu_page('SEC Files', 'Manage SEC Files','manage_options','manage_sec_files','manage_sec_files','',35 );
}
	
function manage_sec_files()
{

	$spaces = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	echo ('
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="/wp-content/plugins/ti_deployment/ti_deploy_jquery.js"></script>
	');
	
	echo ('
	<h2 class="nav-tab-wrapper">
	<a href="#" id="tab-sec-files" class="nav-tab  '.$css_tab_published.'">Docs</a>
	<a href="#" id="tab-xbrl-files" class="nav-tab '.$css_tab_private.'">XBRL Files</a>
	<a href="#" id="tab-instructions" class="nav-tab '.$css_tab_private.'">Instructions</a>
	</h2>
	');

	echo "<div class='tab-section' style='display:none;'  id='table-instructions'>";
	echo "<h2>Instructions</h2>";
	echo "<h3>A Jira ticket must be opened for all transactions.</h3>";
	
	echo "<h3>Uploading PDFs and DOCs</h3>";
	echo "<ol>";
	echo "<li>To upload PDFs and DOCs for 8Ks, 10Qs, etc, click on the Docs tab.</li>";
	echo "<li>Click Choose File and select a file from your computer. The file should be named exactly as it will appear on the web page, 0001104659-15-059007.pdf for example. It may not be picked up if it is not named correctly.</li>";
	echo "<li>Click the Upload SEC File button.</li>";
	echo "<li>File should appear on the top of the list in the DOCs tab.</li>";
	echo "<li>Open a Jira ticket to let developer know that the file is ready to be deployed to the live website.</li>";
	echo "</ol>";
	

	echo "<h3>Uploading XBRL Files</h3>";
	echo "<ol>";
	echo "<li>Click on the XBRL Files tab.</li>";
	echo "<li>Select the correct year and quarter.</li>";
	echo "<li>Click Choose File and select a ZIP file from your computer. No other format, other than ZIP, will work.</li>";
	echo "<li>If a XBRL report will be generated, activate the checkbox titled Generate XBRL Report. The Report Type menu and Accession Number textbox will display. Select the correct report type and fill in the accession number.</li>";
	echo "<li>Click the blue Upload XBRL ZIP File button.</li>";
	echo "<li>Open a Jira ticket to let developer know that the files and/or report are ready to be deployed to the live website.</li>";
	echo "</ol>";


	echo "</div>";
	
	echo "<div class='tab-section' style='display:none;'  id='table-sec-files'>";
	echo "<h2>Manage SEC Files</h2>";


			$sec_dir = "../wp-content/uploads/SECFiles";

			if(isset($_POST["submit"])) {

				$target_file = $sec_dir . '/' . basename($_FILES["fileToUpload"]["name"]);
				echo "target file is $target_file<hr/>";
				$uploadOk = 1;
				$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
				// Check if image file is a actual image or fake image
				if(isset($_POST["submit"])) {
					move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file);
					echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
				}
			}

			?>
			<link rel='stylesheet' type='text/css' href='../wp-content/plugins/ti_deployment/css/ti_deployment.css'/>
			<form method="post" enctype="multipart/form-data">
				Select SEC File:
				<input type="file" name="fileToUpload" id="fileToUpload">
				<input type="submit" value="Upload SEC File" name="submit">
			</form>
			<?php


				$files_time = array();
				if ($dir = opendir("$sec_dir")) {
					while (false !== ($file = readdir($dir))) {
						if ($file != "." && $file != "..") {
							$stat = stat("$sec_dir/$file");
							$mod_time = $stat['mtime'];
							if( strtolower(substr($file,-3,3))=="doc" || strtolower(substr($file,-3,3)=="pdf"))
							{
								$files_time[$file] = $mod_time;
							}
						}
					}
					
					closedir($dir);
					arsort($files_time);

					echo sizeOf($files_time) . " Files In This Directory<br/>";
					$last_file_transfer = get_option('last_file_transfer');
					
					echo "<table>";
					echo "<tr class='  table-headings'>";
					echo "<th></th>";
					echo "<th>File Name</th>";
					echo "<th>Modified</th>";
					echo "<th>File Size</th>";
					echo "</tr>";		
					
					$c = 0;
					
					foreach($files_time as $k=>$v)
					{

					
						$c++;
					
						if($color_class=='global-row-odd')
						{
							$color_class='global-row-even';
						} else {
							$color_class='global-row-odd';
						}

						$file_name	=	$k;
						$file_date 	= 	date ("F d Y H:i:s", $v);
						$file_size	=	number_format(filesize($sec_dir . '/' . $file_name)/1000) . ' KB';

							echo ("<tr class=' $color_class global-rows' >
							
							<td style='text-align:center;'>$c.</td>
							<td style='text-align:center;'><a href='$sec_dir/$k' target='_blank'>$k</la></td>
							<td style='text-align:center;'>$file_date</td>
							<td style='text-align:center;'>$file_size</td>
							</tr>");
					}
				}		
				
				
				echo "</table>";

echo "</div>";

			echo "<div class='tab-section' style='display:block;'  id='table-xbrl-files'>";
			echo "<h2>Manage XBRL Files</h2>";

			echo "<h3>Upload New XBRL Files</h3>";

			if(isset($_POST['y'])) {

				// Prepare the files to be uploaded to the server.
					$xbrl_dir = "../wp-content/uploads/$_POST[y]/Q$_POST[q]";
					$target_file = $xbrl_dir . '/' . basename($_FILES["fileToUpload"]["name"]);
					move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file);
					echo "<h4 style='color:#090;'>The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded and unzipped.</h4>";
					$xbrl_file_name = str_replace('_xbrl_fileset.zip','',basename( $_FILES["fileToUpload"]["name"]));
				// Unzip the XBRL file on the server.
					$unzip = new unZip();
					$unzip->processUnZip($target_file,$xbrl_dir );
					
				// Generate the XBRL Report
					if($_POST['generate_report']=='on')
					{
						$quarter_titles = array('','First','Second','Third','Fourth');
						$report_title = $quarter_titles[$_POST['q']] . ' Quarter Report ' . $_POST['y'];
						$current_user = wp_get_current_user();
						$report_html = ('
							<hr />

							<img alt="" src="/wp-content/themes/trac/img/document_pdf.png" />
							<a href="/wp-content/uploads/SECFiles/'.$_POST['accession_report'].'.pdf" target="_blank">Financial Report - '.$_POST['t'].'</a>

							<strong>XBRL Data</strong>

							Note: XBRL is an XML-based language for the electronic transmission of business and financial data. XBRL is not an accounting standard; it is simply a standard for transmitting business and financial data. The various XBRL exhibits included on this web page are displayed in their native XML format.  The SEC XBRL viewer can be downloaded by <a href="http://www.sec.gov/spotlight/xbrl/viewers.shtml" target="_blank">clicking here</a>. The XBRL viewer transforms the XBRL exhibits and displays this data in a traditional tabular format.  For more information visit the <a href="http://xbrl.sec.gov/" target="_blank">SEC XBRL website</a>.
							<ul>
								<li><img alt="" src="/wp-content/themes/trac/images/xbrl_logo.png" width="30" height="15" /> <a href="/wp-content/uploads/'.$_POST['y'].'/Q'.$_POST['q'].'/'.$xbrl_file_name.'.xml" target="_blank">XBRL INSTANCE DOCUMENT</a></li>
								<li><img alt="" src="/wp-content/themes/trac/images/xbrl_logo.png" width="30" height="15" /> <a href="/wp-content/uploads/'.$_POST['y'].'/Q'.$_POST['q'].'/'.$xbrl_file_name.'.xsd" target="_blank">XBRL TAXONOMY EXTENSION SCHEMA DOCUMENT</a></li>
								<li><img alt="" src="/wp-content/themes/trac/images/xbrl_logo.png" width="30" height="15" /> <a href="/wp-content/uploads/'.$_POST['y'].'/Q'.$_POST['q'].'/'.$xbrl_file_name.'_cal.xml" target="_blank">XBRL TAXONOMY EXTENSION CALCULATION LINKBASE DOCUMENT</a></li>
								<li><img alt="" src="/wp-content/themes/trac/images/xbrl_logo.png" width="30" height="15" /> <a href="/wp-content/uploads/'.$_POST['y'].'/Q'.$_POST['q'].'/'.$xbrl_file_name.'_def.xml" target="_blank">XBRL TAXONOMY EXTENSION DEFINITION LINKBASE DOCUMENT</a></li>
								<li><img alt="" src="/wp-content/themes/trac/images/xbrl_logo.png" width="30" height="15" /> <a href="/wp-content/uploads/'.$_POST['y'].'/Q'.$_POST['q'].'/'.$xbrl_file_name.'_lab.xml" target="_blank">XBRL TAXONOMY EXTENSION LABELS LINKBASE DOCUMENT</a></li>
								<li><img alt="" src="/wp-content/themes/trac/images/xbrl_logo.png" width="30" height="15" /> <a href="/wp-content/uploads/'.$_POST['y'].'/Q'.$_POST['q'].'/'.$xbrl_file_name.'_pre.xml" target="_blank">XBRL TAXONOMY EXTENSION PRESENTATION LINKBASE DOCUMENT</a></li>
							</ul>						
						
						');
					
						$random_suffix = rand(1000,9999);
						$report_link = 'xbrl_' . $_POST['accession_report'];
						
						$xbrl_page = array(
						  'post_title'    	=> $report_title,
						  'post_content'  	=> $report_html,
						  'post_type'		=> 'page',
						  'post_status'   	=> 'publish',
						  'ping_status'   	=> false,
						  'post_author'		=>	$current_user->ID,
						  'page_template'	=> 'page_investorrelations.php',
						  'post_name'		=>	$report_link,
						);

						wp_insert_post( $xbrl_page );
					
						echo "<h4 style='color:#090;'>The report was generated by " . $current_user->user_firstname . " " . $current_user->last_name . " for type $_POST[t] and accession number $_POST[accession_report] as $report_title. <a target='_blank' href='/index.php/".$report_link."'>Click here to view report.</a></h4>";
				
					}
			} else {
			}

			?>
			<form method="post" enctype="multipart/form-data" id="frm-upload-xbrl" class="server-form">
			
			<strong>Files</strong><br/>
			
			Year 
			<select name='y'>
			<?php
			for($y=Date('Y')-1; $y<=Date('Y')+1; $y++)
			{
				if($y==Date('Y'))
				{
					echo "<option selected>$y</option>";
				} else {
					echo "<option>$y</option>";
				}
			}
			?>
			</select><?php echo $spaces;?>
			Quarter
			<select name='q'>
			<?php
			for($q=1; $q<=4; $q++)
			{
				if($q==ceil(Date('m')*.3333))
				{
					echo "<option selected>$q</option>";
				} else {
					echo "<option>$q</option>";
				}
			}
			?>
			</select><?php echo $spaces;?>
			
				Select XBRL ZIP File:
				<input type="file" name="fileToUpload" id="fileToUpload">
			
			<p/>
			
			<strong>Report Details<?php echo $spaces;?><input type="checkbox" id="generate-report" name="generate_report"> <label for="generate-report">Generate XBRL Report</label></strong><br/>
			<div id="generate-report-form" style='display:none;'>
			Report Type 
			<select name='t'>
			<option>8K</option>
			<option>10K</option>
			<option>10Q</option>
			</select><?php echo $spaces;?>
			
			Accession Report #: <input type="text" id="accession-report" name="accession_report"><?php echo $spaces;?>
			</div>
						

				<div style="" class="submit-button-section">
					<input style='opacity:1;' type="submit" class="deploy-buttons" id='xbrl-submit' value="Upload XBRL ZIP File" name="xbrl_submit">
				</div>				
			</form>
	<?php			
	
	echo "<h3>Uploaded XBRL Files</h3>";
	for($y=2014; $y<=Date('Y'); $y++)
	{
		echo "<div style='background:#BBB; width:100%; height:20px; padding:10px 0px; '>$y</div>";
		for($q=1; $q<=4; $q++)
		{
			echo "<div style='background:#CCC; width:100%; height:20px; padding:10px 0px; '>Q$q</div>";
			$sec_dir = "../wp-content/uploads/$y/Q$q";

				if ($dir = opendir("$sec_dir")) {
					while (false !== ($file = readdir($dir))) {
						if ($file != "." && $file != "..") {
							$stat = stat("$sec_dir/$file");
							$mod_time = $stat['mtime'];
							$mod_date = date('n/j/Y H:i:s', $mod_time);
							echo "<div style='background:#DDD; width:100%; margin-bottom:5px; height:20px; padding:10px 0px; '>";
							echo "<div style='float:left; width:20%;'>$mod_date</div>";
							echo "<div style='float:left; width:60%;'><a href='../wp-content/uploads/$y/Q$q/$file' target='_blank'>$file</a></div>";
							echo "</div>";
						}
					}
					closedir($dir);
				}

			
		}		
	}
	echo "</div>";



	
}