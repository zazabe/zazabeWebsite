/*
 * jQuery Printable plugin : Redefine backgroundImage as img tag
 * Version 1.0.0 (13/09/2010)
 * @requires jQuery v1.2.4 or later
 *
 * Copyright (c) 2010 Michel Meyer
 * 
 */

(function($) {

	$.fn.printable = function (options){
		
		options = $.extend({
			title: null,
			css: {
				image: {
					'verticalAlign': 'middle'
				},
				element: {
					'backgroundImage': 'none'
				}
			}
		}, options);
		
		
		return this.each(function(){
			
			if($(this).css('backgroundImage') != 'none'){
				
				var cssPosition = $(this).css('backgroundPosition');
				var position    = (cssPosition != null) ? cssPosition.match(/([0-9]*)px ([0-9]*)px/) : [0, 0];
				
				var bg = {
					url      : $(this).css('backgroundImage').match(/(http.*[a-z])/)[1],
					filename : $(this).css('backgroundImage').replace(/(.*\/)/, '').replace(/(\..*)/, ''),
					position : {
						left : parseInt((position != null && position[1] != null) ? position[1] : 0),
						top  : parseInt((position != null && position[2] != null) ? position[2] : 0)
					}
				};
					
				var imageAttributes = {
						title: (options.title != null ? options.title : bg.filename),
						src:    bg.url
				};
				var image = $('<img>').attr(imageAttributes);
				$(this).prepend(image);
				
				
				var imagePaddingRight = parseInt($(this).css('paddingLeft')) - image.width() - bg.position.left;
				
				
				$(image).css($.extend({
					'paddingRight':  (imagePaddingRight < 0 ? 0 : imagePaddingRight)   + 'px'
				}, options.css.image));
				
				
				$(this).css($.extend({
					'paddingLeft': '0px'
				}, options.css.element));
			
			}
			
		});
	}
})(jQuery);
