<?php // Vars: $article
echo _tag('h1', $article);  
  
echo _open('div#article');

echo _tag('p.done-date', date('F Y', strtotime($article->done_on))  );  

echo markdown($article->body, '.article-body');  

echo _close('div');

  
echo _open('div#relative');
	
	echo _open('div#relContent');
	
	
	  echo _tag('h2', __('Subjects'));  
	
	  echo _open('ul');
	  foreach($article->getTags() as $tag){
	     $tagText = $tag->name.' ('.$tag->countRelatedRecords('Article').')';
	     echo _tag('li',
	               _link($tag)->text($tagText)
	         );
	  }
	  echo _close('ul');
	  
	  echo _tag('h2', __('Pictures'));  
	  
	  echo _open('ul.picture');
	  foreach($article->getDmGallery() as $media){
	    

          $imageTarget = $media->getWidth() > 600 || $media->getHeight() > 450  ?
                                      _media($media)->size(600, 450)->method('fit')->getAbsoluteSrc() :
                                      $media;
                                   
          
	      echo _tag('li',
	                              _link($imageTarget)
                                     ->set('.colorbox rel=article')
                                     ->text( _media($media)->size(160, 130)->method('fit'))
                                     ->title($media->legend)
	         );
	  }
	  echo _close('ul');
  
	echo _close('div');  
	
	echo _link('#')->set('#relSwitcher.open')->text('open/close');
  
echo _close('div');