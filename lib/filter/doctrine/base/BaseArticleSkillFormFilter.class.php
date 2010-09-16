<?php

/**
 * ArticleSkill filter form base class.
 *
 * @package    zazabe
 * @subpackage filter
 * @author     Michel Meyer
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 24171 2009-11-19 16:37:50Z Kris.Wallsmith $
 */
abstract class BaseArticleSkillFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
    ));

    $this->setValidators(array(
    ));
    

    $this->widgetSchema->setNameFormat('article_skill_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'ArticleSkill';
  }

  public function getFields()
  {
    return array(
      'article_id' => 'Number',
      'skill_id'   => 'Number',
    );
  }
}
