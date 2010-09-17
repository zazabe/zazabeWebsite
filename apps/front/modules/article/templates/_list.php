<?php 
use_helper('Date');

echo _open('div#listArticles');

echo isset($additionalText) ? $additionalText : '';

echo  _tag('div.pagerTop', $articlePager->renderNavigationTop());  
 
echo _open('ul.elements');  
 
foreach ($articlePager as $article)  
{  
  echo _open('li.element');  
 
    
    echo _link($article)->set('.pic')->text(_media($article->getFirstMedia())->size(160, 100)->method('fit')->background('#efefef'));  
    
    // wrap the article link into a H2 tag with the t_medium CSS class  
    echo _tag('h2.t_medium', _link($article));  
    
    // show the article extract, processed with markdown  
    echo markdown($article->extract, '.extract');  
 
    // in a P tag, we put some infos about the article  
    echo _tag('p.article_infos',  
      // another link to the article, with the "Read more" translated text  
      _link($article)->text(__('Read more...'))  
    );  
 
  echo _close('li');  
}  
 
echo _close('ul');  
 
echo  _tag('div.pagerBottom',$articlePager->renderNavigationBottom());

echo _close('div');