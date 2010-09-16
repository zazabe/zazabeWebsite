<?php 

include_partial('article/list', array('articlePager'   => $articlePager,
                                      'additionalText' => _tag('strong',__('projects tagged '.$tagName))));
