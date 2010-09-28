SyntaxHighlighter.autoloader.apply(null, [
  'applescript            ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushAppleScript.js',
  'actionscript3 as3      ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushAS3.js',
  'bash shell             ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushBash.js',
  'coldfusion cf          ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushColdFusion.js',
  'cpp c                  ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushCpp.js',
  'c# c-sharp csharp      ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushCSharp.js',
  'css                    ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushCss.js',
  'delphi pascal          ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushDelphi.js',
  'diff patch pas         ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushDiff.js',
  'erl erlang             ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushErlang.js',
  'groovy                 ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushGroovy.js',
  'java                   ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushJava.js',
  'jfx javafx             ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushJavaFX.js',
  'js jscript javascript  ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushJScript.js',
  'perl pl                ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushPerl.js',
  'php                    ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushPhp.js',
  'text plain             ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushPlain.js',
  'py python              ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushPython.js',
  'ruby rails ror rb      ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushRuby.js',
  'sass scss              ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushSass.js',
  'scala                  ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushScala.js',
  'sql                    ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushSql.js',
  'vb vbnet               ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushVb.js',
  'xml xhtml xslt html    ' + mm.themeRootUrl + '/syntax-highlighter/scripts/shBrushXml.js'
]);
SyntaxHighlighter.all();


var box = null;
var qtipOptions = {
	position: {
		corner: {
			target: 'topCenter',
			tooltip: 'bottomLeft'
		}
	},
	style: {
		name: 'cream',
		padding: '7px 13px',
		tip: 'bottomLeft',
		width: {
			max: 250,
			min: 0
		}
	}
};

var skillOptions = {
	tip: {
		options: qtipOptions,
		tip: true
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
		  	
			$('#boxes').qbox({
				slide: {
					effect: 'easeInElastic',
					duration: 3000
				},
				qtime: {
					interval: 4,     //number of step
					step:     1000,  //step duration in ms
					running:  true   //true if timer is running at instanciation
				}
			});
			
			
			$('#boxes li').each(function(){
				$('a.pic', this).removeAttr('title');
				$('a.pic', this).qtip($.extend( qtipOptions, {
					position: {
						corner: {
							target: 'leftMiddle',
							tooltip: 'rightMiddle'
						}
					},
					style: {
						name: 'cream',
						padding: '7px 13px',
						tip: 'rightMiddle'
					},
					content: $('div.extract', this).html()}));
			});
		}
		
		// PAGE INIT
		
		var relswitcher = $('#relSwitcher');
		if(relswitcher.length > 0){
			var relcontent = $('#relContent'), relative = $('#relative'),  article = $('#article');
			var relWidth = {
					to: {
						relcontent: 125 /*relcontent.width()*/,
						relative  : 225 /*relative.width()*/,
						article   : 530 /*article.width()*/
					},
					from: {
						relcontent: 0,
						relative  : 30,
						article   : 730
					}
			};
			relswitcher.addClass('open');
			relswitcher.click(function(){
				if(relswitcher.hasClass('open')){
					relative.animate({  'width' : relWidth.to.relative + 'px'}, 3000, 'easeOutBounce', function() {
					  relswitcher.removeClass('open');
					});
					article.animate({   'width' : relWidth.to.article + 'px'}, 1000, 'linear', function(){
					  setTimeout(function(){
					  	relcontent.css({display: 'block'});
					  	relcontent.animate({'opacity' : '1'}, 2000);	
					  }, 1000);
					});
					
				}
				else {
					relcontent.animate({'opacity' : '0'}, 300, 'linear', function(){
						relcontent.css({display: 'none'});
					});	
					relative.animate({  'width' : relWidth.from.relative + 'px'}, 1000, 'linear');
					article.animate({   'width' : relWidth.from.article + 'px'}, 1000, 'linear', function() {
					  relswitcher.addClass('open');
					});
				}
				return false;
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
