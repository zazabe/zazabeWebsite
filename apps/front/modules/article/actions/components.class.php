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
	
	public function executeListBySkill()
    {  
      // $this->dmTag;  
      $query = $this->getListProjectsQuery();   
      $this->articlePager = $this->getPager($query);  
    } 
	
	public function executeListByTag()
    {  
      // $this->dmTag;  
      $query = $this->getListProjectsQuery();   
      $this->articlePager = $this->getPager($query);  
      $this->tagName = $this->getRequestParameter('slug');
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
