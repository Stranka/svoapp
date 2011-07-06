<?php get_header(); ?>

	<div id="content">



<div class="entry">
		<?php if (have_posts()) : ?>

		 <?php $post = $posts[0]; // Hack. Set $post so that the_date() works. ?>
<?php /* If this is a category archive */ if (is_category()) { ?>
		<h3>Archive for the &#8216;<?php single_cat_title(); ?>&#8217; Category</h3>

 	  <?php /* If this is a daily archive */ } elseif (is_day()) { ?>
		<h3>Archive for <?php the_time('F jS, Y'); ?></h3>

	 <?php /* If this is a monthly archive */ } elseif (is_month()) { ?>
		<h3>Archive for <?php the_time('F, Y'); ?></h3>

		<?php /* If this is a yearly archive */ } elseif (is_year()) { ?>
		<h3>Archive for <?php the_time('Y'); ?></h3>

	  <?php /* If this is an author archive */ } elseif (is_author()) { ?>
		<h3>Author Archive</h3>

		<?php /* If this is a paged archive */ } elseif (isset($_GET['paged']) && !empty($_GET['paged'])) { ?>
		<h3>Blog Archives</h3>

		<?php } ?>
</div>


						
		<?php while (have_posts()) : the_post(); ?>
		<div class="entry">


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
		<h2 class="center">Not Found</h2>
</div>

	<?php endif; ?>

	</div>

<?php get_sidebar(); ?>

<?php get_footer(); ?>
