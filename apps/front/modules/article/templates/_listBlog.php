<?php 
foreach ($blogSubjects as $subject)
{
	echo _tag('h2', $subject);  
	
	foreach($subject->getNode()->getChildren() as $article){
	
		 
	    // wrap the article link into a H2 tag with the t_medium CSS class  
	    echo _tag('h3.t_medium', _link($article));  
	    
	    echo _link($article)->set('.pic')->text(_media($article->getFirstMedia())->size(160, 100)->method('center'));  
		
	    // show the article extract, processed with markdown  
	    echo markdown($article->extract, '.extract');  
	 
	    // in a P tag, we put some infos about the article  
	    echo _tag('p.article_infos',  
	      // another link to the article, with the "Read more" translated text  
	      _link($article)->text(__('Read more...')));  
	}
}
