<?php
/**
 * Skill components
 * 
 * No redirection nor database manipulation ( insert, update, delete ) here
 */
class skillComponents extends myFrontModuleComponents
{
	public function executeList()
	{
		$query = $this->getListQuery('skill')
					  ->where('skill.level = 0')
					  ->orderBy('skill.position DESC');   
		$this->skillPager = $this->getPager($query);

	}

}
