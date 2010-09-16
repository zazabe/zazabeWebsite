<?php

/**
 * article admin form
 *
 * @package    zazabe
 * @subpackage article
 * @author     Michel Meyer
 */
class ArticleAdminForm extends BaseArticleForm
{
  public function configure()
  {
    parent::configure();
    
    /*
    $this->setWidget('skills_list', new sfWidgetFormDoctrineChoice(array('multiple' => true, 
    																	 'model'    => 'Skill', 
    																	 'expanded' => true)));

    $this->setValidator('skills_list', new sfValidatorDoctrineChoice(array('multiple' => true, 
    																       'model'    => 'Skill', 
    																       'required' => false)));
    
    */
    
    
    // create a new widget to represent this article "parent"
    $this->setWidget('parent', new sfWidgetFormDoctrineChoiceNestedSet(array(
      'model'     => 'Article',
      'add_empty' => true,
    )));

    // if the current article has a parent, make it the default choice
    if ($this->getObject()->getNode()->hasParent())
    {
      $this->setDefault('parent', $this->getObject()->getNode()->getParent()->getId());
    }

    
    $this->useFields(array(
    'title', 'is_active', 'author', 'parent', 'body', 'extract'
    ));
    
    
    
    // set labels of fields
    $this->widgetSchema->setLabels(array(
      'name'   => 'Article',
      'parent' => 'Parent Article',
    ));
    // set a validator for parent which prevents a article being moved to one of its own descendants
    $this->setValidator('parent', new sfValidatorDoctrineChoiceNestedSet(array(
      'required' => false,
      'model'    => 'Article',
      'node'     => $this->getObject(),
    )));
    $this->getValidator('parent')->setMessage('node', 'A article cannot be made a descendent of itself.');
  }
  
  
  public function doDelete($con = null)
  {
  }
  
  public function doSave($con = null)
  {
        // save the record itself
    parent::doSave($con);
    
    $test = 'toto';
   // if a parent has been specified and if it's a different parent, add/move this node to be the child of that node
    if ($this->getValue('parent') )
    {
      $parent = Doctrine::getTable('Article')->findOneById($this->getValue('parent'));
      
      if ($this->isNew())
      {
        $this->getObject()->getNode()->insertAsLastChildOf($parent);
      }
      else
      {
        $this->getObject()->getNode()->moveAsLastChildOf($parent);
      }
    }
    // if no parent was selected and node is not already a root node, add/move this node to be a new root in the tree
    else
    {
      $articleTree = Doctrine::getTable('Article')->getTree();
      if ($this->isNew())
      {
        $articleTree->createRoot($this->getObject());
      }
      else
      {
        $this->getObject()->getNode()->makeRoot($this->getObject()->getId());
      }
    }

  }
  
}