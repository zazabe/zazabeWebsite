<?php
/**
 * Article actions
 */
class articleActions extends myFrontModuleActions
{

  public function executePrint(){
  
  }
  
  public function executeDownload(){
  }
  
  public function executeAjax(){
  	$articleTable = Doctrine_Core::getTable('Article');
  	$id = $this->getRequestParameter('id');
  	$article = $articleTable->find($id);
  	$this->article = $article;
  	
  }
  
}
