<?php

$text = markdown($article->body);

if(preg_match('/##mediaList##/', $text))
{
	if(0 < $article->getNbMedias()){
		$images = '';
		foreach($article->getDmGallery() as $media){
			$imageTarget = $media->getWidth() > 600 || $media->getHeight() > 450  ?
						     str_replace(' ', '%20', _media($media)->size(600, 450)->method('scale')->getSrc()) :
						     $media;
			 

			$images .= _link($imageTarget)
							->set('.colorbox rel=demo')
							->text( _media($media)->size(150, 100)->method('scale')->background('#eeeeee'))
							->title($media->legend);
		}
		
		$text = str_replace('##mediaList##', $images, $text);

	}

}
echo $text;

$assets = sfYaml::load($article->extract);



if(isset($assets['javascripts'])){
	foreach($assets['javascripts'] as $js){
		$test = javascript_include_tag($js);
		echo $test;
	}
}

if(isset($assets['stylesheets'])){
	foreach($assets['stylesheets'] as $css){
		$test = stylesheet_tag($css);
		echo $test;
	}
}

