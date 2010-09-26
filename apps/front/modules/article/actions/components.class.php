<?php
/**
 * Article components
 *
 * No redirection nor database manipulation ( insert, update, delete ) here
 *
 *
 */
class articleComponents extends myFrontModuleComponents
{

	public function executeList()
	{
		$query = $this->getListProjectsQuery();   
		$this->articlePager = $this->getPager($query);

	}

	public function executeShow()
	{
		$query = $this->getShowProjectsQuery();   
		$this->article = $this->getRecord($query);
	}
	
    public function executeListCursus()
	{
		$query = $this->getListQuery('article')
                      ->addWhere('article.root_id = 21 AND article.level = ?', 1);   

		$this->articlePager = $this->getPager($query);
	}
	
	public function executeListBlog()
	{
		$blogQuery = $this->getShowQuery('article')->where('article.id = ?', 25);
		$blog = $this->getRecord($blogQuery);
		$this->blogSubjects = $blog->getNode()->getChildren();
	}	
	
	public function executeListBySkill()
    {  
      // $this->dmTag;  
      $query = $this->getListProjectsQuery();   
      $this->articlePager = $this->getPager($query);  
    } 
	
	public function executeListByTag()
    {  
      $this->tag = Doctrine_Core::getTable('dmTag')->find($this->getPage()->getRecordId());
      $query = $this->getListProjectsQuery();   
      $this->articlePager = $this->getPager($query);  
     
    } 

	public function executeListAsBox()
    {  
      $query = $this->getListProjectsQuery();   
      $this->articlePager = $this->getPager($query);  
    }
    
    
    protected function getListProjectsQuery(){
      return $this->getListQuery('article')
                    ->addWhere('article.level > ?', 1);   
    	
    }
    
    protected function getShowProjectsQuery(){
      return $this->getShowQuery('article')
                    ->addWhere('article.level > ?', 1);   
    }
    
    
    
   
    
    
}
