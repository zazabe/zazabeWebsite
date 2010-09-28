<?php
/** @var dmFrontLayoutHelper */
$helper = $sf_context->get('layout_helper');

echo
$helper->renderDoctype(),
$helper->renderHtmlTag(),

  "\n<head>\n",
$helper->renderHead(),
  "\n</head>\n",

$helper->renderBodyTag(),

$sf_content,

$helper->renderEditBars(),

'<script type="text/javascript">'.
"\nvar mm = {themeRootUrl : '"._compute_public_path('','themeZazabe2','', true)."'};".
"</script>",
$helper->renderJavascriptConfig(),
$helper->renderJavascripts(),
$helper->renderGoogleAnalytics(),

  "\n</body>\n",

"\n</html>";