<?php
/*
 * Render a page.
 * Layout areas and page content area are rendered.
 *
 * Available vars :
 * - dmFrontPageHelper $helper      ( page_helper service )
 * - boolean           $isEditMode  ( whether the user is allowed to edit page )
 */
?>
<a id="ruban" href="http://diem-project.org/" title="powered by Diem, based on symfony 1.4, Zend 1.10, jQuery 1.4">powered by Diem</a>

<div id="dm_page" <?php $isEditMode && print ' class="edit"' ?>>
	<div class="dm_layout">
	  
        <?php include_partial('dmFront/navigation', array('helper' => $helper)) ?>
		
		<div id="main"><?php echo $helper->renderArea('page.content') ?></div>
		
		<?php echo $helper->renderArea('layout.bottom', '.clearfix') ?>
			
	</div>
</div>
