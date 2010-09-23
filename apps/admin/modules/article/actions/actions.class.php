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
  
  
  public function executeAll(){
  	$this->articles = Doctrine_Core::getTable('Article')->findAll();
  }
}
