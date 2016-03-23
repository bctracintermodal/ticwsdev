<?php

/*
Plugin Name: Trac Intermodal Functionality
Description: Various required functionality for the new TRAC Intermodal website
Author: Bruce Chamoff
Version: 1.0
*/

add_shortcode('sugar-crm-caseform','sugar_crm_caseform');
function sugar_crm_caseform()
{
	$url = 'http://contactus.tracintermodal.com/CaseForm/Default.aspx';
	$caseform = file_get_contents($url);
	$caseform = str_replace('Images/TRAC_Intermodal_web','http://contactus.tracintermodal.com/CaseForm/Images/TRAC_Intermodal_web',$caseform);
	$caseform = str_replace('Images/loader.gif','http://contactus.tracintermodal.com/CaseForm/Images/loader.gif',$caseform);
	$caseform = str_replace('/CaseForm/Scripts/modernizr-2.6.2.js','http://contactus.tracintermodal.com/CaseForm/Scripts/modernizr-2.6.2.js',$caseform);
	$caseform = str_replace('/CaseForm/Scripts/utils-1.0.0.js','http://contactus.tracintermodal.com/CaseForm/Scripts/utils-1.0.0.js',$caseform);
	$caseform = str_replace('Scripts/jquery-1.8.2.min.js','http://contactus.tracintermodal.com/CaseForm/Scripts/jquery-1.8.2.min.js',$caseform);
	$caseform = str_replace('Scripts/jquery-ui-1.8.24.min.js','http://contactus.tracintermodal.com/CaseForm/Scripts/jquery-ui-1.8.24.min.js',$caseform);
	$caseform = str_replace('Content/Site.css','http://contactus.tracintermodal.com/CaseForm/Content/Site.css',$caseform);
	$caseform = str_replace('/CaseForm/ScriptResource.axd','http://contactus.tracintermodal.com/CaseForm/ScriptResource.axd',$caseform);
	
	$curl = curl_init();
	curl_setopt($curl, CURLOPT_URL, $url);
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($curl, CURLOPT_HEADER, false);
	$caseform = curl_exec($curl);
	curl_close($curl);

	$caseform = str_replace('Content/Site.css','http://contactus.tracintermodal.com/CaseForm/Content/Site.css',$caseform);
	$caseform = str_replace('Scripts/jquery-1.8.2.min.js','http://contactus.tracintermodal.com/CaseForm/Scripts/jquery-1.8.2.min.js',$caseform);
	$caseform = str_replace('Scripts/jquery-ui-1.8.24.min.js','http://contactus.tracintermodal.com/CaseForm/Scripts/jquery-ui-1.8.24.min.js',$caseform);
	$caseform = str_replace('Images/TRAC_Intermodal_web','http://contactus.tracintermodal.com/CaseForm/Images/TRAC_Intermodal_web',$caseform);
	$caseform = str_replace('Images/loader.gif','http://contactus.tracintermodal.com/CaseForm/Images/loader.gif',$caseform);
	$caseform = str_replace('/CaseForm/Scripts/modernizr-2.6.2.js','http://contactus.tracintermodal.com/CaseForm/Scripts/modernizr-2.6.2.js',$caseform);
	$caseform = str_replace('/CaseForm/Scripts/utils-1.0.0.js','http://contactus.tracintermodal.com/CaseForm/Scripts/utils-1.0.0.js',$caseform);
	$caseform = str_replace('/CaseForm/ScriptResource.axd','http://contactus.tracintermodal.com/CaseForm/ScriptResource.axd',$caseform);
	
	return $caseform;
}

add_shortcode('chassis-lookup','chassis_lookup');
function chassis_lookup()
{
	
		$css = ('
			position:absolute;
			color:#fff;
			top:50%;
			left:50%;
			-ms-transform: translateX(-50%) translateY(-50%);
			-webkit-transform: translate(-50%,-50%);
			transform: translate(-50%,-50%);	
			display:none;
			height:500px;
			background:white;
			z-index:1000000;
		');
		$cl_lb_css = ('
			position:absolute;
			top:-150px;
			left:-150px;
			background-color:black;
			display:none;
			height:300%;
			width:300%;
			z-index:900000;
			opacity:.75; 
		');

		/*
		
		$content = ('
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
		<script src="http://tibeta.wpengine.com/wp-content/plugins/ti_functionality/load_chassislookup.js"></script>
		<a href="#" id="link-get-chassis-lookup">Chassis Lookup</a>
		|
		<a href="#" id="link-get-unit-lookup">Unit Lookup</a>
		<div id="chassis-lookup-lightbox" style="' . $cl_lb_css . '"></div>
		<div style="'.$css.'" id="chassis-lookup">
		<div id="close-button" style="position:absolute;right:10px;top:10px;"><img width="20" src="/wp-content/plugins/ti_functionality/close.png"/></div>
		<iframe id="iframe-lookup" frameborder="0" scrolling="auto" width="700" height="650" src="http://www.tracintermodal.com/unitlookup/tlookup_eao.asp"></iframe>
		</div> 
		');
		*/
		
		$content = ('
		<a target="_blank" href="http://www.tracintermodal.com/unitlookup/tlookup_eao.asp">Chassis Lookup</a> | 
		<a target="_blank" href="http://www.tracintermodal.com/unitlookup/lookup.asp">Unit Lookup</a>
		');
		return $content;
}



add_shortcode('sec-files','get_sec_files');
add_filter('the_content','fix_theme_case');
function fix_theme_case($content)
{
	$content = str_replace('wp-content/themes/trac','wp-content/themes/TRAC',$content);
	return $content;
}

add_shortcode('get-jqm','get_jqm');
function get_jqm($atts, $content=null)
{
	$a = shortcode_atts( array(
		'type' => 'startstop',
	), $atts );
	
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $randstring = '';
    for ($i = 0; $i < 10; $i++) {
        $randstring = $characters[rand(0, strlen($characters))];
    }
	
	$css = "font-size:12pt;";
	
	$content = ('
	<a href="/location-map?mt=tpcp" class="map-links" style="'.$css.'" id="tpcp">TPCP 2</a> | 
	<a href="/location-map?mt=startstop" class="map-links" style="'.$css.'" id="startstop">Start Stop</a> | 
	<a href="/location-map?mt=ndp" class="map-links" style="'.$css.'" id="ndp">NDP</a> | 
	');
	
	$content = "";

	
	
	$map_type = 'startstop';
	if(isset($_GET['mt']))
	{
		$map_type = $_GET['mt'];
	}
	$content .= file_get_contents('http://tibeta.wpengine.com/jquerymaps/all?' . $randstring);
	return $content;
}


function get_sec_files($atts, $content=null)
{
	
	global $wpdb;
	
	$html = ("
			<style>
				.entry-content a img, .entry-summary a img, .comment-content a img, .textwidget a img {
					display: inline;
				}
			</style>
			");

	
	$html .= "<table id='sec-table'>";

	
	$html .= ("<tr style='background:#3399FF;' >");
	$html .= ("<th>Filing Date</th>");
	$html .= ("<th>Form</th>");
	$html .= ("<th>Description</th>");
	$html .= ("<th>Downloads</th>");
	$html .= ("</tr>");
	$file_count = $wpdb->get_var( "SELECT COUNT(*) FROM trac_tblsecfilling" );
	
	
	$fields = array('id','filing_date','filing_type','form_name','accession_nunber','filing_href','wordlink','pdflink','xbrllink');
	$icons  = array('filing_href','wordlink','pdflink','xbrllink');
	$sql = "SELECT ".implode(',',$fields)." FROM trac_tblsecfilling Order By filing_date desc";
	//$html .= "$sql<br/>";
	$sec_files = $wpdb->get_results($sql);
	$section_counter = 0;
	foreach ( $sec_files as $sec_file ) 
	{

		$section_counter++;
	
		$doclink = $sec_file->wordlink;
		$pdflink = $sec_file->pdflink;
		$xbrllink = $sec_file->xbrllink;
		$accnum = $sec_file->accession_nunber;
		$filing_type = $sec_file->filing_type;
		$id = $sec_file->id;
		$form_name = $sec_file->form_name;
		$filing_href = $sec_file->filing_href;
		$id = $sec_file->id;

		$links = checkforlinks($doclink,$pdflink,$xbrllink,$accnum,$filing_type,$filing_href);
		$links = str_replace('http://cws.tracintermodal.com/','/',$links);

		$filing_type = str_replace('/',SLASH,$sec_file->filing_type);
		
		$class_display = '';
		
		if($section_counter>NUMBER_ROWS)
		{
			$class_display='hidden-rows';
		}
		

		$html .= ("<tr class=' $class_display $filing_type sec_rows sec-row-$section_counter' id='$id' >");
		$html .= ("<td style='text-align:center; width:15%; '> ".formatted_date($sec_file->filing_date)."</td>");
		$html .= ("<td style='text-align:center; width:10%;  '>".$filing_type."</td>");
		$html .= ("<td style='text-align:center; width:50%;  '>".$sec_file->form_name."</td>");
		$html .= ("<td style='text-align:center; width:25%;  '>".$links."</td>");
		$html .= ("</tr>");
	}	

	
	$html .= "</table>";
	return $html; 
	
}  

function formatted_date($date)
{
			$date_array = explode('-',$date);
			return (int)$date_array[1] . '/' . (int)$date_array[2] . '/' . $date_array[0];
}

	function checkforlinks($doclink,$pdflink,$xbrllink,$accnum,$filing_type,$filing_href){
		$doclink = str_replace('http://' . $_SERVER['SERVER_NAME'],'',$doclink);
		$pdflink = str_replace('http://' . $_SERVER['SERVER_NAME'],'',$pdflink);
		
		if ($doclink == ''){
			  $dlink = "<img src='/wp-content/plugins/ti_functionality/images/word_go.gif' border='0'/>&nbsp;";			  
		}
		else{
			  $dlink = "<a href='".$doclink."' target='_blank'><img src='/wp-content/plugins/ti_functionality//images/word.gif' border='0'/></a>&nbsp;";			  
		}
	
		if ($pdflink == ''){
			  $plink = "<img src='/wp-content/plugins/ti_functionality/images/pdf_go.png' border='0'/>&nbsp;";			  
		}
		else{
			  $plink = "<a href='".$pdflink."' target='_blank'><img src='/wp-content/plugins/ti_functionality/images/pdf.png' border='0'/></a>&nbsp;";			  
		}		
		
		
		$page = get_page_by_name('xbrl_'.$accnum);	
		
		 if($filing_type == '10-Q' || $filing_type == '10-Q/A' || $filing_type == '10-K'){
			if (!empty($page)){
				$xlink = "<a target='_blank' href='".$xbrllink."'><img src='/wp-content/plugins/ti_functionality/images/xbrl.gif' border='0'/></a>";			  
			}
			else{
				$xlink = "<img src='/wp-content/plugins/ti_functionality/images/xbrl_go.gif' border='0'/>";			  
			}
		} else {
				$xlink = "<img src='/wp-content/plugins/ti_functionality/images/xbrl_go.gif' border='0'/>";			  
		}		
		
		$html = ("
		<a href='".$filing_href."' target='_blank'><img src='/wp-content/plugins/ti_functionality/images/table_link.png' border='0'/></a>&nbsp;".
		$dlink.
		$plink.
		$xlink.
		''
		);
		
		//Replace any DOCX extensions with DOC
		$html 	= 	str_replace('.docx','.doc',$html);
		$html	=	str_replace('http://' . $_SERVER['SERVER_NAME'],'',$html);
		return $html;		
	}	

function get_page_by_name($pagename) 
{
$pages = get_pages();
foreach ($pages as $page) if ($page->post_name == $pagename) return $page;
return false;
}

?>