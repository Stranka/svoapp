<div id="sidebar">
<div class="rsidebar">

<ul>

<?php if ( function_exists('dynamic_sidebar') && dynamic_sidebar(1) ) : else : ?>	

<?php wp_list_categories('show_count=0&title_li=<h2>Categories</h2>'); ?>

<li><h2>Archives</h2>
<ul>
<?php wp_get_archives('type=monthly'); ?>
</ul>
</li>
		
<?php /* If this is the frontpage */ if ( is_home() || is_page() ) { ?>
<?php wp_list_bookmarks(); ?>

<?php } ?> 
<?php endif; ?>

<li><h2>Meta</h2>
<ul>
	<li><a href="<?php bloginfo('rss2_url'); ?>" title="<?php _e('Syndicate this site using RSS'); ?>"><?php _e('<abbr title="Really Simple Syndication">RSS</abbr>'); ?></a></li>
	<li><a href="<?php bloginfo('comments_rss2_url'); ?>" title="<?php _e('The latest comments to all posts in RSS'); ?>"><?php _e('Comments <abbr title="Really Simple Syndication">RSS</abbr>'); ?></a></li>
	<li><a href="http://wordpressthemesbase.com">Wordpress Theme</a></li>
	<?php wp_meta(); ?>
</ul>
</li>

</ul>

</div>	
</div>
