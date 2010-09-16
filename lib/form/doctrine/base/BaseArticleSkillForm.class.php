<?php

/**
 * ArticleSkill form base class.
 *
 * @method ArticleSkill getObject() Returns the current form's model object
 *
 * @package    zazabe
 * @subpackage form
 * @author     Michel Meyer
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseArticleSkillForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'article_id' => new sfWidgetFormInputHidden(),
      'skill_id'   => new sfWidgetFormInputHidden(),
    ));

    $this->setValidators(array(
      'article_id' => new sfValidatorChoice(array('choices' => array($this->getObject()->get('article_id')), 'empty_value' => $this->getObject()->get('article_id'), 'required' => false)),
      'skill_id'   => new sfValidatorChoice(array('choices' => array($this->getObject()->get('skill_id')), 'empty_value' => $this->getObject()->get('skill_id'), 'required' => false)),
    ));

    $this->widgetSchema->setNameFormat('article_skill[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'ArticleSkill';
  }

}
