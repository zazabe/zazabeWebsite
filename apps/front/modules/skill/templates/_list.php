<?php


foreach($skillPager as $skill)
{
	if($skill->getNode()->hasChildren())
	{
		$descendants = $skill->getNode()->getDescendants();
		
		echo _open('div.skills-bloc');
		echo _tag('h3', $skill->name);
		echo _open('ul.skills');
		foreach($descendants as $descendant)
		{
			echo _tag('li.level'.$descendant->experience, _tag('span.spacer', str_repeat('&nbsp;&nbsp;', $descendant->level-1)._tag('span',$descendant)).
							_tag('div.skillbar.off', 
								_tag('div.skillbar.on')));
		
		}
		echo _close('ul');
		echo _close('div');		
	}
}

