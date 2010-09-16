<?php

/**
 * Article
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @package    zazabe
 * @subpackage model
 * @author     Michel Meyer
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
class Article extends BaseArticle
{
  protected $cursus, $childrenProjects, $childrenTags;
  
  
  protected function initChildrenProjects(){
    if(!isset($this->childrenProjects)){
      $this->childrenProjects = $this->getNode()->getChildren();
    }
  }
  
  public function initCursus(){
    if(!isset($this->cursus)){
      $infos = explode('|', $this->getTitle());
      $this->cursus = array(
        'diplomas' => explode('|', $this->getExtract()),
        'date'     => $infos[0],
        'name'     => $infos[1],
        'place'    => $infos[2],
      );  
    }
  }
  
  public function getChildrenTags(){
    $this->initChildrenProjects();
    
    if(!isset($this->childrenTags)){
      $tags = array();
      foreach($this->childrenProjects as $projects){
        foreach($projects->getTags() as $tag){
          $tags[$tag->id] = $tag;
        }
      }
      foreach($this->getTags() as $tag){
        $tags[$tag->id] = $tag;
      }
      
      $this->childrenTags = $tags;
    }
    
    return $this->childrenTags;
  }
  
  public function getChildrenProjects(){
    $this->initChildrenProjects();
    return $this->childrenProjects;
  }
  
  
  public function getCursusDiplomas(){
    $this->initChildrenProjects();
    return $this->cursus['diplomas'];
  }
  
  public function hasCursusDiplomas(){
    $this->initCursus();
    return !empty($this->cursus['diplomas']);
  }
  
  public function getCursusName(){
    $this->initCursus();
    return $this->cursus['name'];
  }
  
  public function getCursusPlace(){
    $this->initCursus();
    return $this->cursus['place'];
  }
  
  public function getCursusDate(){
    $this->initCursus();
    return $this->cursus['date'];
  }
}
