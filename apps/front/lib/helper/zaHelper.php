<?php 

function stylize($string)
{
  $replacement = array(
  						'/\[/' => '<strong>',
                        '/\]/' => '</strong>',
                      );
  foreach($replacement as $pattern => $value)
  {
    $string = preg_replace($pattern, $value, $string);
  } 
                      
  return $string;
}