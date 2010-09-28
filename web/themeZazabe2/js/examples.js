$(document).ready(function(){
  
  // init tabs for examples 
  if($('#examples').nextAll('ul').length > 0)
  {
  	var tabsNub = 1, demoTab, tabcontent = null;
  	$('#examples').nextAll('ul').each(function(){
		
		if($('a', this).eq(0).text() == 'demo')
		{
			demoTab = {
				demo : {
					url: $('a', this).eq(0).attr('href'),
					id: 'tab-' + tabsNub++
				},
				source : {
					url: $('a', this).eq(1).attr('href'),
					id: 'tab-' + tabsNub++
				}
			};
			
			tabcontent = $('<div class="tabs">' + 
								'<ul>' +
								'<li><a class="demos" href="#' + demoTab.demo.id + '">demo</a></li>' +
								'<li><a class="demos" href="#' + demoTab.source.id + '">source</a></li>' +
						        '</ul>' +
								'<div id="' + demoTab.demo.id + '"></div>' +
								'<div id="' + demoTab.source.id + '"></div>' +
						 '</div>');
			
			$('#' + demoTab.demo.id, tabcontent).data('ajaxUrl', demoTab.demo.url).data('loaded', false);
			$('#' + demoTab.source.id, tabcontent).data('ajaxUrl', demoTab.source.url).data('loaded', false);
			
			$(this).replaceWith(tabcontent);
		}
	});
	
	var url = '';
	$('div.tabs').tabs({
		select: function(event, ui) {
			if (!$(ui.panel).data('loaded')) {
				$(ui.panel).load($(ui.panel).data('ajaxUrl')).data('loaded', true);
				
			}
			qboxInst = $('div.qboxes', this).qbox();
			if(qboxInst != null)
			{
				if ($(ui.tab).text() == 'demo') {
					qboxInst.resume();
				}
				else if ($(ui.tab).text() == 'source') {
					qboxInst.pause();
				}	
			}	
			
			
		},	
		show: function(event, ui) {  
			if(!$(ui.panel).data('loaded')){
				$(ui.panel).load($(ui.panel).data('ajaxUrl')).data('loaded', true);
			}
		}	
	});
	
	
  }
  
});
