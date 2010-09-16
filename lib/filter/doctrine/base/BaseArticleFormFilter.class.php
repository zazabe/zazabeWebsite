<?php

/**
 * Article filter form base class.
 *
 * @package    zazabe
 * @subpackage filter
 * @author     Michel Meyer
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 24171 2009-11-19 16:37:50Z Kris.Wallsmith $
 */
abstract class BaseArticleFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'author'      => new sfWidgetFormDoctrineChoice(array('model' => 'DmUser', 'add_empty' => true)),
      'position'    => new sfWidgetFormDmFilterInput(),
      'root_id'     => new sfWidgetFormDmFilterInput(),
      'lft'         => new sfWidgetFormDmFilterInput(),
      'rgt'         => new sfWidgetFormDmFilterInput(),
      'level'       => new sfWidgetFormDmFilterInput(),
      'skills_list' => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'Skill')),
      'medias_list' => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'DmMedia')),
      'tags_list'   => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'DmTag')),
    ));

    $this->setValidators(array(
      'author'      => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Author'), 'column' => 'id')),
      'position'    => new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))),
      'root_id'     => new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))),
      'lft'         => new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))),
      'rgt'         => new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))),
      'level'       => new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))),
      'skills_list' => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'Skill', 'required' => false)),
      'medias_list' => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'DmMedia', 'required' => false)),
      'tags_list'   => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'DmTag', 'required' => false)),
    ));
    
    $this->mergeI18nForm();


    $this->widgetSchema->setNameFormat('article_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function addSkillsListColumnQuery(Doctrine_Query $query, $field, $values)
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
          ->andWhereIn('ArticleSkill.skill_id', $values);
  }

  public function addMediasListColumnQuery(Doctrine_Query $query, $field, $values)
  {
    if (!is_array($values))
    {
      $values = array($values);
    }

    if (!count($values))
    {
      return;
    }

    $query->leftJoin('r.ArticleDmMedia ArticleDmMedia')
          ->andWhereIn('ArticleDmMedia.dm_media_id', $values);
  }

  public function addTagsListColumnQuery(Doctrine_Query $query, $field, $values)
  {
    if (!is_array($values))
    {
      $values = array($values);
    }

    if (!count($values))
    {
      return;
    }

    $query->leftJoin('r.ArticleDmTag ArticleDmTag')
          ->andWhereIn('ArticleDmTag.dm_tag_id', $values);
  }

  public function getModelName()
  {
    return 'Article';
  }

  public function getFields()
  {
    return array(
      'id'          => 'Number',
      'author'      => 'ForeignKey',
      'position'    => 'Number',
      'root_id'     => 'Number',
      'lft'         => 'Number',
      'rgt'         => 'Number',
      'level'       => 'Number',
      'id'          => 'Number',
      'title'       => 'Text',
      'extract'     => 'Text',
      'body'        => 'Text',
      'is_active'   => 'Boolean',
      'lang'        => 'Text',
      'created_at'  => 'Date',
      'updated_at'  => 'Date',
      'version'     => 'Number',
      'skills_list' => 'ManyKey',
      'medias_list' => 'ManyKey',
      'tags_list'   => 'ManyKey',
    );
  }
}
