<?php 


echo '
<table caption="Michel Meyer\'s cursus" summary="This is my professional history, incuding my studies and jobs experences.">
	<caption>Cursus</caption>
	<thead>
		<tr>
			<th id="itemcolumn" scope="col">Year</th>
			<th id="col1" scope="col">Description</th>
		</tr>
	</thead>
	<tbody>';
	
    foreach($articlePager as $article){
       echo _open('tr');   
         echo _tag('td.years'.($article->hasCursusDiplomas() ? '.school' : '.work'), _tag('strong', $article->getCursusDate()));   
         echo _open('td');
         echo _tag('h2',  $article->getCursusName());
         
         if($article->hasCursusDiplomas()){
         echo _open('ul.diplomas');
           foreach($article->getCursusDiplomas() as $diploma){
             echo _tag('li', stylize($diploma));
           }
         echo _close('ul');
         }
         _tag('span', $article->getCursusPlace());
         
       echo _close('tr');   
       
       echo _open('tr.details'); 
         echo _open('td.related');   
           
           
           echo _tag('h3.pro', __('Projects:'));
           echo _open('ul.projects');
             foreach($article->getNode()->getDescendants() as $project){
                 $class = $project->level > 2 ? '.subprojects' : '';
                 echo _tag('li'.$class, _link($project));
             };
           echo _close('ul');
           
           echo _tag('h3.sub', __('Subjects:'));
           echo _open('ul.subjects');
             foreach($article->getChildrenTags() as $tag){
                $tagText = $tag->name.' ('.$tag->countRelatedRecords('Article').')';
                echo _tag('li',
                           _link($tag)->text($tagText)
                     );
  
             };
           echo _close('ul');
         echo _close('td');
         
         echo _open('td.descriptions headers="itemcolumn col1"');
           
           echo markdown($article->body);
         echo _close('td');
   
       
       echo _close('tr');
    }

echo '		
</tbody>
</table>';