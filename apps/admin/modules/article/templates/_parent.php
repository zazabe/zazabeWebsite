<?php
$node = $article->getNode();
if ($node->hasParent()) {
  echo $node->getParent()->getTitle();
}
else {
  
  echo 'no parent'.($node->isRoot() ? ' (root)' : '');
}