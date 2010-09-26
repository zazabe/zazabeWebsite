/*
 * jQuery Skillable plugin : display/animate a bar representing a skill level
 * Version 1.0.0 (13/09/2010)
 * @requires jQuery v1.2.4 or later
 *
 * Copyright (c) 2010 Michel Meyer
 * 
 */
(function($) {

var skillable = function (element, options){
	this.element = element;
	
	this.element.getLevel = function(options){
		var string = $(this).attr(options.level.attribute);
		var match  = string.match(options.level.pattern);
		return (match != null) ? match[1] : 0;
	}
	
	this.element.getName = function(){
		return $('a',this).text();
	}
	
	
	this.options = $.extend({
		maxlevel: 5,
		onInit: function(skillable){
			if(!skillable.options.printable.enable){
				skillable.animate();
			}
		},
		level: {
			attribute: 'class',
			pattern: new RegExp('([0-9])')
		},
		bar: {
			off: '.skillbar.off',
			on:  '.skillbar.on'
		},
		animation: {
			effect: 'linear',
			duration: 1000
		},
		tip: {},
		printable: {}
	}, options);
	
	this.options.tip = $.extend({
		enable: true,
		options: {},
		levelName: ['tried', 'use sometimes', 'often used', 'confident', 'expert'],
		sentence: '%%experienceName%%'
	}, options.tip);
	
	this.options.printable = $.extend({
		enable: false,
		images:  ['level1.jpg', 'level2.jpg', 'level3.jpg', 'level4.jpg', 'level5.jpg'],
		baseUrl: ''
	}, options.printable);

	
	if(this.options.printable.enable){
		this.printable();
	}
	else if(this.options.tip.enable){
		this.attachTip();
	}
	
	this.options.onInit(this);
}

skillable.prototype.attachTip = function(){
	var sentence = this.options.tip.sentence;
	sentence = sentence.replace('%%skillName%%', this.element.getName());
	sentence = sentence.replace('%%experienceName%%', this.options.tip.levelName[this.element.getLevel(this.options)-1]);
	this.element.sentence = sentence;
	
	$(this.options.bar.off, this.element).qtip($.extend( this.options.tip.options, {content: this.element.sentence}));
}

skillable.prototype.animate = function(){
	var barOn  = $(this.options.bar.on, this.element),
		barOff = $(this.options.bar.off, this.element),
		coef   = barOff.width()/this.options.maxlevel;
	
	$(barOn).animate({
		width: parseInt(this.element.getLevel(this.options) * coef) 
	}, this.options.animation.duration, this.options.animation.effect);
}

skillable.prototype.printable = function(){
	var imageAttributes = {
			title:  this.element.sentence,
			src:    this.options.printable.baseUrl + this.options.printable.images[this.element.getLevel(this.options)-1]
	};
	
	var image = $('<img>').attr(imageAttributes);
	
	$(this.options.bar.off, this.element).css({'backgroundImage' : 'none'});
	$(this.options.bar.on, this.element).replaceWith(image);
}




$.fn.skillable = function (options){
	var skill = null;
	this.each(function(){
		if(null == $(this).data('skillable')){
			skill = new skillable(this, options);
			$(this).data('skillable', skill);
		}
		else {
			skill = $(this).data('skillable');
		}
	});
	return skill;
}

})(jQuery);
