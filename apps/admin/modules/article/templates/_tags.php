<?php
$tags = $article->getTags();
$display = array();
foreach($tags as $tag){
  $display[] = $tag->getName();
}
echo implode(', ', $display);