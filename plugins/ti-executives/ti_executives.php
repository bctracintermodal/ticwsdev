<?php
/*
Plugin Name: TRAC Intermodal Executives
Description: Manage executives as a custom post type
*/


add_action( 'init', 'exec_taxonomies', 0 );
function exec_taxonomies() {

 $labels = array(
    'name'              => _x( 'Executive Types', 'taxonomy general name' ),
    'singular_name'     => _x( 'Executive Type', 'taxonomy singular name' ),
    'add_new_item'     	=> _x( 'Add New Executive Type'),
  );
  $args = array(
    'labels' => $labels,
    'hierarchical' => true,
  );

	register_taxonomy( 'exec_type', 'executives', $args );
}


add_action( 'init', 'create_exec_type' );
function create_exec_type() {

// Set UI labels for Custom Post Type
	$labels = array(
		'name'                => _x( 'Executives', 'Post Type General Name' ),
		'singular_name'       => _x( 'Executive', 'Post Type Singular Name' ),
		'menu_name'           => __( 'Executives' ),
		'all_items'           => __( 'All Executives' ),
		'view_item'           => __( 'View Executive' ),
		'add_new_item'        => __( 'Add New Executive' ),
		'add_new'             => __( 'Add New' ),
		'edit_item'           => __( 'Edit Executive' ),
		'update_item'         => __( 'Update Executive' ),
		'search_items'        => __( 'Search Executive' ),
		'not_found'           => __( 'Not Found' ),
		'not_found_in_trash'  => __( 'Not found in Trash' ),
	);
	
// Set other options for Custom Post Type
	
	$args = array(
		'label'               => __( 'executive' ),
		'description'         => __( 'All executives of TRAC Intermodal ' ),
		'labels'              => $labels,
		// Features this CPT supports in Post Editor
		'supports'            => array( 'title', 'editor', 'author', 'thumbnail', 'revisions', 'custom-fields', ),
		// You can associate this CPT with a taxonomy or custom taxonomy. 
		'taxonomies'          => array( 'location_type' ),
		/* A hierarchical CPT is like Pages and can have
		* Parent and child items. A non-hierarchical CPT
		* is like Posts.
		*/	
		'hierarchical'        => false,
		'public'              => true,
		'show_ui'             => true,
		'show_in_menu'        => true,
		'show_in_nav_menus'   => true,
		'show_in_admin_bar'   => true,
		'menu_position'       => 5,
		'can_export'          => true,
		'has_archive'         => true,
		'exclude_from_search' => false,
		'publicly_queryable'  => true,
		'capability_type'     => 'page',
	);
	
	// Registering your Custom Post Type
	register_post_type( 'executive', $args );

}


add_action( 'add_meta_boxes', 'executive_information' );
function executive_information() {
    add_meta_box( 
        'executive-info',
        __( 'Executive Information', 'myplugin_textdomain' ),
        'get_executive',
        'executive',
        'normal',
        'high'
    );
}

function get_executive( $post ) {
  wp_nonce_field( plugin_basename( __FILE__ ), 'get_executive_box_content_nonce' );
  
  $executive_job_title 	= get_post_meta(get_the_ID(),'executive_job_title',true);
  echo '<label for="executive_job_title">Job Title</label> <input size="40" type="text" id="executive_job_title" name="executive_job_title" value="'.$executive_job_title.'" placeholder="Job Title" />&nbsp;&nbsp;&nbsp;&nbsp;';

  $executive_display_order 	= get_post_meta(get_the_ID(),'executive_display_order',true);
  echo '<label for="executive_job_title">Display Order</label> <input size="5" type="text" id="executive_display_order" name="executive_display_order" value="'.$executive_display_order.'" placeholder="" /><br/>';

}

add_action( 'save_post', 'save_executive_meta' );
function save_executive_meta( $post_id ) {

  $executive_job_title = $_POST['executive_job_title'];
  update_post_meta( $post_id, 'executive_job_title', $executive_job_title );

  $executive_display_order = $_POST['executive_display_order'];
  update_post_meta( $post_id, 'executive_display_order', $executive_display_order );

}


?>