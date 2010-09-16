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
			echo _tag('li.level'.$descendant->experience, _tag('span.spacer', str_repeat('> ', $descendant->level-1)._link($descendant)).
							_tag('div.skillbar.off', 
								_tag('div.skillbar.on')));
		/*	
			echo _tag('li.level'.$descendant->experience, _tag('span.spacer', str_repeat('> ', $descendant->level-1)._link($descendant)).
							_tag('div.skillbar.off  style="background-position:'.($descendant->experience*25.6).'px 0px;"', 
							_tag('div.skillbar.on style="width:'.($descendant->experience*25.6).'px;"')));
		*/
		}
		echo _close('ul');
		echo _close('div');		
	}
}

