<?php 
$count = $tag->countRelatedRecords('Article');
$count_text = $count > 1 ?
			  $count.' articles are' :
			  '1 article is';

include_partial('article/list', array('articlePager'   => $articlePager,
                                      'additionalText' => _tag('h1', $count_text.' tagged '._tag('strong',$tag))));
