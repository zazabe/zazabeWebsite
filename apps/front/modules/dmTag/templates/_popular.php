<?php // Vars: $dmTagPager

echo _open('ul.elements');

$max_num = 1;
$min_num = 1;
$coef    = 0;
$max_em  = 3;

foreach ($dmTags as $dmTag)
{
	if($dmTag->total_num > $max_num){
		$max_num =  $dmTag->total_num;
		$coef =  $max_em / $max_num;
	}
	$nb_em = round($coef * $dmTag->total_num);
    echo _open('li(.element');

    $tagText = str_repeat(_open('em'), $nb_em).
    			$dmTag->name.' ('.$dmTag->total_num.')'.
    		   str_repeat(_close('em'), $nb_em);

    if($dmTag->hasDmPage())
    {
      echo _link($dmTag)->text($tagText);
    }
    else
    {
      echo $tagText;
    }

  echo _close('li');
}

echo _close('ul');