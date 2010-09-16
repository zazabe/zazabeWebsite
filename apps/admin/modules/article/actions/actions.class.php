<?php

require_once dirname(__FILE__).'/../lib/articleGeneratorConfiguration.class.php';
require_once dirname(__FILE__).'/../lib/articleGeneratorHelper.class.php';

/**
 * article actions.
 *
 * @package    zazabe
 * @subpackage article
 * @author     Michel Meyer
 * @version    SVN: $Id: actions.class.php 12474 2008-10-31 10:41:27Z fabien $
 */
class articleActions extends autoArticleActions
{
  
  public function executeDelete(sfWebRequest $request)
  {
    
    $record = $this->getObjectOrForward404($request);
  
    $this->dispatcher->notify(new sfEvent($this, 'admin.delete_object', array('object' => $record)));
    
    $record->getNode()->delete();

    $this->getUser()->setFlash('notice', 'The item was deleted successfully.');

    $this->redirect('@article');
  }
  
  
  protected function executeBatchDelete(sfWebRequest $request)
  {
    $table = $this->getDmModule()->getTable();
    $ids = $request->getParameter('ids');
    
    foreach($table->createQuery()->whereIn($this->getDmModule()->getTable()->getPrimaryKey(), $ids)->fetchRecords() as $record)
    {
      $record->notify('delete');
    }

    foreach($ids as $id){
      $article = Doctrine_Core::getTable('Article')->findOneById($id);
      $article->getNode()->delete();
    }
    
    /*
    $count = $table->createQuery()
      ->delete()
      ->from($this->getDmModule()->getModel())
      ->whereIn($this->getDmModule()->getTable()->getPrimaryKey(), $ids)
      ->execute();
     */
    
    
    if ($count >= count($ids))
    {
      $this->getUser()->logInfo('The selected items have been deleted successfully.');
    }
    else
    {
      $this->getUser()->logInfo('A problem occurs when deleting the selected items.');
    }

    $this->redirect('@'.$this->getDmModule()->getUnderscore());
  }
  
  
  public function executeResetTree(){
  
    $resetQuery = "UPDATE `zazabe`.`article` SET `root_id` = NULL ,`lft` = NULL ,`rgt` = NULL ,`level` = NULL";
    
    
    $q = Doctrine_Query::create()
        ->update('Article a')
        ->set('a.root_id', 'NULL')
        ->set('a.lft', 'NULL')
        ->set('a.rgt', 'NULL')
        ->set('a.level', 'NULL')
        ->execute();
    
     
    $q = Doctrine_Query::create()
          ->from('Article a');
    $articles = $q->execute();
    $firstArticle = $articles->getFirst();  
      
    $treeObject = Doctrine_Core::getTable('Article')->getTree();
    $treeObject->createRoot($firstArticle);
       
    
    $prevArticle = $firstArticle;
    foreach($articles as $article){
      if($article->getId() != $firstArticle->getId()){
        $article->getNode()->insertAsLastChildOf($prevArticle);
        $prevArticle = $article;
      }
    }
    
    return sfView::NONE;
  }
}
