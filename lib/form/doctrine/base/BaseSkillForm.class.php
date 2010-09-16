<?php

/**
 * Skill form base class.
 *
 * @method Skill getObject() Returns the current form's model object
 *
 * @package    zazabe
 * @subpackage form
 * @author     Michel Meyer
 * @version    SVN: $Id$
 */
abstract class BaseSkillForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'            => new sfWidgetFormInputHidden(),
      'experience'    => new sfWidgetFormInputText(),
      'position'      => new sfWidgetFormInputText(),
      'root_id'       => new sfWidgetFormInputText(),
      'lft'           => new sfWidgetFormInputText(),
      'rgt'           => new sfWidgetFormInputText(),
      'level'         => new sfWidgetFormInputText(),

        'articles_list' => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'Article', 'expanded' => true)),
    ));

    $this->setValidators(array(
      'id'            => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'experience'    => new sfValidatorInteger(),
      'position'      => new sfValidatorInteger(array('required' => false)),
      'root_id'       => new sfValidatorInteger(array('required' => false)),
      'lft'           => new sfValidatorInteger(array('required' => false)),
      'rgt'           => new sfValidatorInteger(array('required' => false)),
      'level'         => new sfValidatorInteger(array('required' => false)),
        'articles_list' => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'Article', 'required' => false)),
    ));

    if('embed' == sfConfig::get('dm_i18n_form'))
    {
      $this->embedI18n(sfConfig::get('dm_i18n_cultures'));
    }
    else
    {
      $this->mergeI18nForm();
    }

    $this->widgetSchema->setNameFormat('skill[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
    
    // Unset automatic fields like 'created_at', 'updated_at', 'position'
    // override this method in your form to keep them
    parent::unsetAutoFields();
  }


  protected function doBind(array $values)
  {
    parent::doBind($values);
  }
  
  public function processValues($values)
  {
    $values = parent::processValues($values);
    return $values;
  }
  
  protected function doUpdateObject($values)
  {
    parent::doUpdateObject($values);
  }

  public function getModelName()
  {
    return 'Skill';
  }

  public function updateDefaultsFromObject()
  {
    parent::updateDefaultsFromObject();

    if (isset($this->widgetSchema['articles_list']))
    {
      $this->setDefault('articles_list', $this->object->Articles->getPrimaryKeys());
    }

  }

  protected function doSave($con = null)
  {
    $this->saveArticlesList($con);

    parent::doSave($con);
  }

  public function saveArticlesList($con = null)
  {
    if (!$this->isValid())
    {
      throw $this->getErrorSchema();
    }

    if (!isset($this->widgetSchema['articles_list']))
    {
      // somebody has unset this widget
      return;
    }

    if (null === $con)
    {
      $con = $this->getConnection();
    }

    $existing = $this->object->Articles->getPrimaryKeys();
    $values = $this->getValue('articles_list');
    if (!is_array($values))
    {
      $values = array();
    }

    $unlink = array_diff($existing, $values);
    if (count($unlink))
    {
      $this->object->unlink('Articles', array_values($unlink));
    }

    $link = array_diff($values, $existing);
    if (count($link))
    {
      $this->object->link('Articles', array_values($link));
    }
  }

}