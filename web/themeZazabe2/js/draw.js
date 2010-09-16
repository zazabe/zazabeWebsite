


var draw = function (options){
	
	options = $.extend({
		draw: $('#draw'),
		drawContainer: $('#middle-banner'),
		container: $('#banner'),
		menu: $('#menu'),
		effect: 'linear',
		duration: 1000
	}, options);
	

	var isOpen = false;
	var countAnim = 0;
	
	var size = {
			drawHeight: options.draw.height(),
			drawContainerHeight: 244,
			containerHeight: 244,
			menuHeight: options.menu.height()
		};
	
	this.toggle = function(){
		if(isOpen){
			this.close();
		}
		else {
			this.open();
		}
		isOpen = isOpen ? false : true;
	};
	
	this.close = function(){
		$(options.draw).animate({
		    height: '0',
		  }, options.duration, options.effect, this.finished);

		$(options.container).animate({
		    height:  size.menuHeight  + 25,
		  }, options.duration, options.effect, this.finished);

		$(options.drawContainer).animate({
		    height:  size.menuHeight  + 25,
		  }, options.duration, options.effect, this.finished);
		
		$(options.menu).animate({
		    height:  size.menuHeight + 10,
		  }, options.duration, options.effect, this.finished);
	
		$('#sea').animate({
		    top:  20 - $('#sea').height(),
		  }, options.duration + ( options.duration * 0.2), options.effect);
		
		$('#montain1').animate({
		    top:  100 - $('#montain1').height(),
		  }, options.duration + ( options.duration * 0.4), options.effect);
		
		$('#montain2').animate({
		    top:  150 - $('#montain2').height(),
		  }, options.duration + ( options.duration * 0.6), options.effect);
	};
	
	this.open = function(){
		$(options.draw).animate({
		    height: size.drawHeight,
		  }, options.duration, options.effect, this.finished);

		$(options.drawContainer).animate({
		    height: size.drawContainerHeight,
		  }, options.duration, options.effect, this.finished);
		
		$(options.container).animate({
		    height: size.containerHeight,
		  }, options.duration, options.effect, this.finished);
		
		$(options.menu).animate({
		    height:  size.menuHeight,
		  }, options.duration, options.effect, this.finished);
		
		$('#sea').animate({
		    top:  5,
		  }, options.duration - ( options.duration * 0.2), options.effect);
		
		$('#montain1').animate({
		    top:  5,
		  }, options.duration - ( options.duration * 0.4), options.effect);
		
		$('#montain2').animate({
		    top:  5,
		  }, options.duration - ( options.duration * 0.6), options.effect);
	};
	
	this.finished = function(){
		countAnim++;
		if(countAnim >= 4){
			countAnim = 0;
			options.draw.trigger('animEnded');
		}
	};
}