<?php

foreach ($articles as $article)  
{  
  echo _open('div');  
 
  	echo _tag('h1 style="font-size:3em;display: block; border-top: 1px solid #000;height:3.7em;"', $article->title);
  	
  	echo _tag('h2 style="font-size:2em;"', 'Extrait:');
  	echo markdown($article->extract, '.extract');  
 
  	echo _tag('h2 style="font-size:2em;"', 'Texte:');
  	echo markdown(strip_tags($article->body));  
 
  echo _close('div');
}