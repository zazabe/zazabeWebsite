dp.SyntaxHighlighter.ClipboardSwf = '/themeZazabe2/syntax-highlighter/swf/clipboard.swf';
dp.SyntaxHighlighter.HighlightAll('code');


var box = null;
var skillOptions = {
	tip: {
		options: {
	  	  position: {
            corner: {
              target: 'topCenter',
              tooltip: 'bottomLeft'
            }
	      },
	      style: {
	        name: 'cream',
	        padding: '7px 13px',
	        width: {
	          max: 250,
	          min: 0
            },
	        tip: true
	      }
 	    }
	},
	animation: {
		duration: 3000,
		effect: 'easeOutBounce'
	}
};

$(document).ready(function(){
		
		// HOME INIT
		
		if($('#boxes').length > 0){
			$('#boxes').css({
				position: 'relative',
				width:     ($('#boxes li').outerWidth(true)*3),
				height:   ($('#boxes li').outerHeight(true)*3)
			});
		  	box = new boxes({effect: 'easeInElastic', duration: 3000, interval: 4000});
		}
		
		// PAGE INIT
		
		var relswitcher = $('#relSwitcher');
		if(relswitcher.length > 0){
			var relcontent = $('#relContent'), relative = $('#relative'),  article = $('#article');
			var relWidth = {
					from: {
						relcontent: relcontent.width(),
						relative  : relative.width(),
						article   : article.width()
					},
					to: {
						relcontent: 0,
						relative  : 30,
						article   : 730
					}
			};
			
			relswitcher.click(function(){
				if(relcontent.width() > relWidth.to.relcontent){
					relcontent.animate({width : relWidth.to.relcontent});
					relative.animate({  width : relWidth.to.relative});
					article.animate({   width : relWidth.to.article});
				}
				else {
					relcontent.animate({width : relWidth.from.relcontent});
					relative.animate({  width : relWidth.from.relative});
					article.animate({   width : relWidth.from.article});
				}
			});
		}
		
		
		$('a.colorbox').colorbox();
		
		
		//PRINT INIT;
		if($('body.print').length > 0){
			$('body.print li').add('tbody .related h3').printable();
			
			skillOptions =  $.extend({
				printable: {
					enable: true,
					baseUrl: '/themeZazabe2/images/'
				}
			}, skillOptions);
		}
		
		// RESUME INIT
		if($('ul.skills').length > 0){
			$('ul.skills li').skillable(skillOptions);
		}
		
});
