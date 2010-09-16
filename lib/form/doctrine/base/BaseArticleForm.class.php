<?php

/**
 * Article form base class.
 *
 * @method Article getObject() Returns the current form's model object
 *
 * @package    zazabe
 * @subpackage form
 * @author     Michel Meyer
 * @version    SVN: $Id$
 */
abstract class BaseArticleForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'          => new sfWidgetFormInputHidden(),
      'author'      => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Author'), 'add_empty' => false)),
      'position'    => new sfWidgetFormInputText(),
      'root_id'     => new sfWidgetFormInputText(),
      'lft'         => new sfWidgetFormInputText(),
      'rgt'         => new sfWidgetFormInputText(),
      'level'       => new sfWidgetFormInputText(),

        'skills_list' => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'Skill', 'expanded' => true)),
          'tags_list'   => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'DmTag', 'expanded' => true)),
    ));

    $this->setValidators(array(
      'id'          => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'author'      => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Author'))),
      'position'    => new sfValidatorInteger(array('required' => false)),
      'root_id'     => new sfValidatorInteger(array('required' => false)),
      'lft'         => new sfValidatorInteger(array('required' => false)),
      'rgt'         => new sfValidatorInteger(array('required' => false)),
      'level'       => new sfValidatorInteger(array('required' => false)),
        'skills_list' => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'Skill', 'required' => false)),
          'tags_list'   => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'DmTag', 'required' => false)),
    ));

    if('embed' == sfConfig::get('dm_i18n_form'))
    {
      $this->embedI18n(sfConfig::get('dm_i18n_cultures'));
    }
    else
    {
      $this->mergeI18nForm();
    }

    $this->widgetSchema->setNameFormat('article[%s]');

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
    return 'Article';
  }

  public function updateDefaultsFromObject()
  {
    parent::updateDefaultsFromObject();

    if (isset($this->widgetSchema['skills_list']))
    {
      $this->setDefault('skills_list', $this->object->Skills->getPrimaryKeys());
    }

    if (isset($this->widgetSchema['medias_list']))
    {
      $this->setDefault('medias_list', $this->object->Medias->getPrimaryKeys());
    }

    if (isset($this->widgetSchema['tags_list']))
    {
      $this->setDefault('tags_list', $this->object->Tags->getPrimaryKeys());
    }

  }

  protected function doSave($con = null)
  {
    $this->saveSkillsList($con);
    $this->saveMediasList($con);
    $this->saveTagsList($con);

    parent::doSave($con);
  }

  public function saveSkillsList($con = null)
  {
    if (!$this->isValid())
    {
      throw $this->getErrorSchema();
    }

    if (!isset($this->widgetSchema['skills_list']))
    {
      // somebody has unset this widget
      return;
    }

    if (null === $con)
    {
      $con = $this->getConnection();
    }

    $existing = $this->object->Skills->getPrimaryKeys();
    $values = $this->getValue('skills_list');
    if (!is_array($values))
    {
      $values = array();
    }

    $unlink = array_diff($existing, $values);
    if (count($unlink))
    {
      $this->object->unlink('Skills', array_values($unlink));
    }

    $link = array_diff($values, $existing);
    if (count($link))
    {
      $this->object->link('Skills', array_values($link));
    }
  }

  public function saveMediasList($con = null)
  {
    if (!$this->isValid())
    {
      throw $this->getErrorSchema();
    }

    if (!isset($this->widgetSchema['medias_list']))
    {
      // somebody has unset this widget
      return;
    }

    if (null === $con)
    {
      $con = $this->getConnection();
    }

    $existing = $this->object->Medias->getPrimaryKeys();
    $values = $this->getValue('medias_list');
    if (!is_array($values))
    {
      $values = array();
    }

    $unlink = array_diff($existing, $values);
    if (count($unlink))
    {
      $this->object->unlink('Medias', array_values($unlink));
    }

    $link = array_diff($values, $existing);
    if (count($link))
    {
      $this->object->link('Medias', array_values($link));
    }
  }

  public function saveTagsList($con = null)
  {
    if (!$this->isValid())
    {
      throw $this->getErrorSchema();
    }

    if (!isset($this->widgetSchema['tags_list']))
    {
      // somebody has unset this widget
      return;
    }

    if (null === $con)
    {
      $con = $this->getConnection();
    }

    $existing = $this->object->Tags->getPrimaryKeys();
    $values = $this->getValue('tags_list');
    if (!is_array($values))
    {
      $values = array();
    }

    $unlink = array_diff($existing, $values);
    if (count($unlink))
    {
      $this->object->unlink('Tags', array_values($unlink));
    }

    $link = array_diff($values, $existing);
    if (count($link))
    {
      $this->object->link('Tags', array_values($link));
    }
  }

}