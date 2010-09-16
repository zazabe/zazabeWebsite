<?php

/**
 * Skill filter form base class.
 *
 * @package    zazabe
 * @subpackage filter
 * @author     Michel Meyer
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 24171 2009-11-19 16:37:50Z Kris.Wallsmith $
 */
abstract class BaseSkillFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'experience'    => new sfWidgetFormDmFilterInput(),
      'position'      => new sfWidgetFormDmFilterInput(),
      'root_id'       => new sfWidgetFormDmFilterInput(),
      'lft'           => new sfWidgetFormDmFilterInput(),
      'rgt'           => new sfWidgetFormDmFilterInput(),
      'level'         => new sfWidgetFormDmFilterInput(),
      'articles_list' => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'Article')),
    ));

    $this->setValidators(array(
      'experience'    => new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))),
      'position'      => new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))),
      'root_id'       => new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))),
      'lft'           => new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))),
      'rgt'           => new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))),
      'level'         => new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))),
      'articles_list' => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'Article', 'required' => false)),
    ));
    
    $this->mergeI18nForm();


    $this->widgetSchema->setNameFormat('skill_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function addArticlesListColumnQuery(Doctrine_Query $query, $field, $values)
  {
    if (!is_array($values))
    {
      $values = array($values);
    }

    if (!count($values))
    {
      return;
    }

    $query->leftJoin('r.ArticleSkill ArticleSkill')
          ->andWhereIn('ArticleSkill.article_id', $values);
  }

  public function getModelName()
  {
    return 'Skill';
  }

  public function getFields()
  {
    return array(
      'id'            => 'Number',
      'experience'    => 'Number',
      'position'      => 'Number',
      'root_id'       => 'Number',
      'lft'           => 'Number',
      'rgt'           => 'Number',
      'level'         => 'Number',
      'id'            => 'Number',
      'name'          => 'Text',
      'lang'          => 'Text',
      'created_at'    => 'Date',
      'updated_at'    => 'Date',
      'articles_list' => 'ManyKey',
    );
  }
}
