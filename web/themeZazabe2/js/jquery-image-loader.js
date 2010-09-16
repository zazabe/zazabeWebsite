/*
 * jQuery Image Loader plugin
 * Version 1.0.0 (04/06/2009)
 * @requires jQuery v1.2.1 or later
 *
 * Copyright (c) 2009 Michel Meyer
 * 
 */

(function($) {

	$.fn.imageLoader = function (options){
		
		options = $.extend({
			waiterImg: 'waiter.gif',
			errorImg:  'error.gif'
		}, options);
		
		
		return this.each(function(){
			
			if($(this).parent('.image_loader').length == 0)
			{
				$(this).hide();
				
				var cssProperties = {
					'background': 'url(' + options.waiterImg + ') no-repeat center center',
					'width'     : $(this).width(),
					'height'    : $(this).height()
				};
				
				var container = $('<div class="image_loader"></div>').css(cssProperties); 
				
				container.append($(this).clone());
				$(this).replaceWith(container);
				image = container.children('img');
				
				image.load(function(){
					var container = $(this).parent('.image_loader');
					container.css({ 'background': 'none' });
					$(this).fadeIn();
				}).error(function (){
					container.css({ 'background': 'url(' + options.errorImg + ') no-repeat center center' });
				});	
			}
		});
	}
})(jQuery);