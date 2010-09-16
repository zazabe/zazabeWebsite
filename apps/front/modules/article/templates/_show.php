<?php // Vars: $article
echo _tag('h1', $article);  
  
echo _open('div#article');

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
	  
	  echo _open('ul');
	  foreach($article->getDmGallery() as $media){
	    echo _tag('li',
	              _link($media)->set('.colorbox rel=article')->text( _media($media)->size(160, 130)->method('fit'))
	         );
	  }
	  echo _close('ul');
  
	echo _close('div');  
	
	echo _tag('div#relSwitcher', 'open/close');
  
echo _close('div');