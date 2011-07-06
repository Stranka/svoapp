<?php get_header(); ?>

<div id="content"> 


	<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
		<div class="entry">
		<div class="post" id="post-<?php the_ID(); ?>">


<div class="head">
<div class="date">
<h1><?php the_time('M'); ?></h1>
<h2><?php the_time('d'); ?></h2>
</div>
<div class="title">
<h2><a href="<?php echo get_permalink() ?>" rel="bookmark" title="Permanent Link: <?php the_title(); ?>"><?php the_title(); ?></a></h2>
</div>
</div>


		
		
				<?php the_content('<p class="serif">Read the rest of this entry &raquo;</p>'); ?>
<p class="postmetadata"><?php the_category(', ') ?></p>
				<?php wp_link_pages(array('before' => '<p><strong>Pages:</strong> ', 'after' => '</p>', 'next_or_number' => 'number')); ?>

				

			</div>
		</div>

<div class="entry">
	<?php comments_template(); ?>
	</div>

	<?php endwhile; else: ?>
<div class="entry">
		<p>Sorry, no posts matched your criteria.</p>
</div>
<?php endif; ?>

	</div>
<?php get_sidebar(); ?>
<?php get_footer(); ?>
