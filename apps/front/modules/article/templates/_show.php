<?php // Vars: $article
echo _tag('h1', $article);  
  
echo _open('div#article');

echo _tag('p.done-date', date('F Y', strtotime($article->done_on))  );  

echo markdown($article->body, '.article-body');  

echo _close('div');

  
echo _open('div#relative');
	
	echo _open('div#relContent');
	  
	  if( $article->getNode()->hasParent() && $article->level > 2){
	      echo _tag('p.parent_project', __(_tag('strong', $article->title).' is a part of '._link($article->getNode()->getParent())).' project');  
      }
	
	  if( $article->getNode()->hasChildren()){
	      echo _tag('h2', __('Related'));  
    	  
	      echo _open('ul');
	      foreach($article->getNode()->getChildren() as $subprojects){
    	     echo _tag('li',
    	               _link($subprojects)
    	         );
    	  }
    	  echo _close('ul');
	  
	  }
	  if($article->hasTags()){
		  echo _tag('h2', __('Subjects'));  
		  echo _open('ul');
		  foreach($article->getTags() as $tag){
		     $tagText = $tag->name.' ('.$tag->countRelatedRecords('Article').')';
		     echo _tag('li',
		               _link($tag)->text($tagText)
		         );
		  }
		  echo _close('ul');
	  }
	  
	  if(0 < $article->getNbMedias()){
	  	echo _tag('h2', __('Pictures'));  
		  echo _open('ul.picture');
		  foreach($article->getDmGallery() as $media){
		    
	
	         $test =  _media($media)->size(600, 450)->method('fit');  
		      
	          $imageTarget = $media->getWidth() > 600 || $media->getHeight() > 450  ?
	                                     str_replace(' ', '%20', _media($media)->size(600, 450)->method('fit')->getSrc()) :
	                                      $media;
	                                   
	          
		      echo _tag('li',_link($imageTarget)
                                     ->set('.colorbox rel=article')
                                     ->text( _media($media)->size(160, 130)->method('fit')->background('#eeeeee'))
                                     ->title($media->legend)
			  );
		  }
		  echo _close('ul');
	  }
	    
	echo _close('div');  
	
	echo _link('#')->set('#relSwitcher.open')->text('open/close');
  
echo _close('div');
