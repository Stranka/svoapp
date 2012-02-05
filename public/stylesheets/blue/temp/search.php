<?php get_header(); ?>

	<div id="content">

	<?php if (have_posts()) : ?>

		<?php while (have_posts()) : the_post(); ?>

			<div class="entry">

<h3>Search Results</h3>	


<div class="head">
<div class="date">
<h1><?php the_time('M'); ?></h1>
<h2><?php the_time('d'); ?></h2>
</div>
<div class="title">
<h2><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title(); ?>"><?php the_title(); ?></a></h2>
</div>
</div>
<?php the_content_rss('', TRUE, '', 50); ?>
<p class="postmetadata"><?php the_category(', ') ?> - <?php comments_popup_link('No Comments &#187;', '1 Comment &#187;', '% Comments &#187;'); ?></p>
				</div>

		<?php endwhile; ?>

		<div class="navigation">
			<p><?php next_posts_link('&#171; Previous Entries') ?>
			<?php previous_posts_link('| Next Entries &#187; ') ?></p>
		</div>

	<?php else : ?>
	<div class="entry">
		<h2 class="center">No posts found. Try a different search?</h2>

</div>
	<?php endif; ?>

	</div>

<?php get_sidebar(); ?>

<?php get_footer(); ?>