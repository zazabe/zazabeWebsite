<?php

/**
 * skill admin form
 *
 * @package    zazabe
 * @subpackage skill
 * @author     Michel Meyer
 */
class SkillAdminForm extends BaseSkillForm
{
  public function configure()
  {
    parent::configure();
    
    $this->setWidget('articles_list', new sfWidgetFormDoctrineChoice(array('multiple' => true, 
    																	   'model'    => 'Article', 
    																	   'expanded' => true)));
	
	
	
	$this->setValidator('articles_list', new sfValidatorDoctrineChoice(array('multiple' => true, 
    																		 'model'    => 'Article', 
    																		 'required' => false)));
    
  	$this->setWidget('parent', new sfWidgetFormDoctrineChoiceNestedSet(array(
      'model'     => 'Skill',
      'add_empty' => true,
    )));
    
    $this->useFields(array(
    	'name', 'experience', 'articles_list', 'parent'
    ));
    
    // set labels of fields
    $this->widgetSchema->setLabels(array(
      'name'   => 'Skill',
      'parent' => 'Parent Skill',
    ));
    // set a validator for parent which prevents a article being moved to one of its own descendants
    $this->setValidator('parent', new sfValidatorDoctrineChoiceNestedSet(array(
      'required' => false,
      'model'    => 'Skill',
      'node'     => $this->getObject(),
    )));
    $this->getValidator('parent')->setMessage('node', 'A skill cannot be made a descendent of itself.');
	
  }
  
  public function updateDefaultsFromObject()
  {
    parent::updateDefaultsFromObject();

    if (isset($this->widgetSchema['articles_list']))
    {
    	$this->setDefault('articles_list', $this->object->ArticlesSkills->getPrimaryKeys());
    }
    
    if ($this->getObject()->getNode()->hasParent())
    {
      $this->setDefault('parent', $this->getObject()->getNode()->getParent()->getId());
    }
  }
  
 public function doSave($con = null)
  {
        // save the record itself
    parent::doSave($con);
    
   
    if ($this->getValue('parent') )
    {
      $parent = Doctrine::getTable('Skill')->findOneById($this->getValue('parent'));
      
      if ($this->isNew())
      {
        $this->getObject()->getNode()->insertAsLastChildOf($parent);
      }
      else
      {
        $this->getObject()->getNode()->moveAsLastChildOf($parent);
      }
    }
    else
    {
      $articleTree = Doctrine::getTable('Skill')->getTree();
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