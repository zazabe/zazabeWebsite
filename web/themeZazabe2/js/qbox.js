/*
 * jQuery qBox plugin : animate nine mobile box
 * Version 1.0.0 (13/09/2010)
 * @requires jQuery v1.2.4 or later
 *
 * Copyright (c) 2010 Michel Meyer
 * 
 */
var qbox = function (target, options){
	
	this.target = target;
	
	this.setOptions(options);
	
	this.init();
	
};

/*
 * Public methods
 */

qbox.prototype.resume = function(){
	this.timer.resume();
};

qbox.prototype.pause = function(){
	this.timer.pause();
};

qbox.prototype.reset = function(){
	this.init();
};

qbox.prototype.isRunning = function(){
	return this.timer.isRunning();
};

/*
 * Protected methods
 */

qbox.prototype.init = function(){

	$(this.target).addClass('qboxes');

	this.endedAnimation = 0;
	
	this.initBoxesObject();
	
	this.setupBoxes();
		
	//repositioning boxesObjects to display
	this.initBoxesPosition();
	
	//define outside graphical position
	this.defineOutsidePositions();
	
	//filter slide position 
	this.filterOutsidePositions();
	
	this.addListener();
	
	this.initTimer();
};

/***** Init methods *****/

qbox.prototype.setOptions = function(options){
	this.options = $.extend({
		slide: {
			effect:    'linear',
			duration:  500,
			from: 'all',     //can be all, top, right, bottom or left
			by:   'random',  //can be random, asc or desc 
			custom: null     //define slide position by using a function (override slide.from and slide.by properties)
		},                   //   function(qBoxInstance){} (qbox instance is given in parameter)
		box: {
			selector: 'li',  //box jQuery selector
			rows:     3,     //number of row
			cols:     3      //number by row
		},
		qtime: {
			interval: 2,     //number of step
			step:     1000,  //step duration in ms
			running:  true   //true if timer is running at instanciation
		}
	}, options);
	
	
	
	this.options.box = $.extend({
		height:    $(this.options.box.selector, this.target).outerHeight(true),
		width:     $(this.options.box.selector, this.target).outerWidth(true),
		displayed: this.options.box.cols * this.options.box.rows
	}, this.options.box);
};

qbox.prototype.initBoxesObject = function(){
	//boxes object composition:
	// - displayed          = matrice of boxes
	// - visible            = list of visible boxes
	// - hidden             = list of hidden boxes
	// - outside            = list of outside possible position for hidden boxes
	//   - pos.left/pos.top = pixel position 
	this.boxes = {
		displayed:      [], 
		visible:        [], 
		hidden:         [], 
		outside: {
			current:   -1,    //current slide position, not used if slide position is randomly define 
			all:        {},
			active:     {},
			//method to filter outside position
			getWith: function(anim, moveDirection){
				var filtred = [], slidePosition = null, pattern = new RegExp('\\' + moveDirection + '[0-9]*');
				
				
				for(var index=0; index<this.all.length; index++){
					slidePosition = this.all[index];
					if (slidePosition.anim == anim && pattern.test(slidePosition.move)) {
				 		filtred.push(slidePosition); 
					}
				}
				return filtred;
			}
		}
	};
};

qbox.prototype.setupBoxes = function(){
	
	//define elements as box matrice, who is hidden or not...
	var els          = $(this.options.box.selector, this.target), 
	    col          = 0, 
	    row          = 0;
	
	for(i=0 ; i < els.length ; i++){
		col = i%this.options.box.cols;
		row = i!=0 && col == 0 ? row+1 : row;
		
		if(i < this.options.box.displayed){
			if(!this.boxes.displayed[row]){
				this.boxes.displayed[row] = [];
			}
			this.boxes.displayed[row][col] = els[i];
			this.boxes.visible.push(els[i]);
		}
		else {
			this.boxes.hidden.push(els[i]);
		}
	
	}
};

qbox.prototype.initBoxesPosition = function(){
	$(this.options.box.selector, this.target).css({
		'position' : 'absolute',
		'left'     : -3000,
		'top'      : -3000
	});
	
	var uid = 0;
	$(this.options.box.selector, this.target).each(function(i,el){
		$(el).data('uid', uid++);
	});
	
	var options = this.options;
	
	this.walkBoxesMatrice(function(row, col, box){
		$(box).css({
			'left': (options.box.width  * col) + 'px',
			'top' : (options.box.height * row) + 'px'
		});
	});
};

qbox.prototype.defineOutsidePositions = function(){
	var outside    = [],
		lastRowId  = this.boxes.displayed.length - 1,
	    lastColId = this.boxes.displayed[lastRowId].length - 1,
	    options    = this.options;
	
	this.walkBoxesMatrice(function(row, col, box){
		
		var rows = [], cols = [];
		
		
		//set params for top anim   # 
		//                          |
		//                          V
		//                          #
		//                          #
		if(row == 0){
			
			rows = []; cols = [];
			for(i=0;i<=lastRowId;i++){
				cols.push(col);
				rows.push(i);
			}
			outside.push({
				pos : {
					left  : $(box).position().left,
					top   : $(box).position().top - options.box.height
				},
				move  : '+' + options.box.height,
				rows  : rows,
				cols  : cols,
				anim  : 'top'
			});
		}
		
		//set params for bottom anim   # 
		//                             #
		//                             ^
		//                             |
		//                             #
		if(row == lastRowId){
			rows = []; cols = [];
			for(i=lastRowId;i>=0;i--){
				cols.push(col);
				rows.push(i);
			}

			outside.push({
				pos : {
					left  : $(box).position().left,
					top   : $(box).position().top + options.box.height
				},
				move  : '-' + options.box.height,
				rows  : rows,
				cols  : cols,
				anim  : 'top'
			});
		}
		//set params for left anim   #->###
		if(col == 0){
			rows = []; cols = [];
			for(i=0;i<=lastColId;i++){
				cols.push(i);
				rows.push(row);
			}

			outside.push({
				pos : {
					left  : $(box).position().left - options.box.width,
					top   : $(box).position().top
				},
				move  : '+' + options.box.width,
				rows  : rows,
				cols  : cols,
				anim  : 'left'
			});
		}
		//set params for right anim   ###<-#
		if(col == lastColId){
			rows = []; cols = [];
			for(i=lastColId;i>=0;i--){
				cols.push(i);
				rows.push(row);
			}
			outside.push({
				pos : {
					left  : $(box).position().left + options.box.width,
					top   : $(box).position().top
				},
				move  : '-' + options.box.width,
				rows  : rows,
				cols  : cols,
				anim  : 'left'
			});
		}
		
	});
	this.boxes.outside.all = outside;
	
	
};

qbox.prototype.filterOutsidePositions = function(){
	var activeOutside = {};
	switch(this.options.slide.from) {
		case 'top':
		    activeOutside = this.boxes.outside.getWith('top', '+');
			break;
		case 'right':
		    activeOutside = this.boxes.outside.getWith('left', '-');
			break;
		case 'bottom':
		    activeOutside = this.boxes.outside.getWith('top', '-');
			break;
		case 'left':
		    activeOutside = this.boxes.outside.getWith('left', '+');
			break;
		default: 
			activeOutside = this.boxes.outside.all;
	}
	this.boxes.outside.active = activeOutside;
};

qbox.prototype.addListener = function(){
	$(this).bind('boxsAnimationFinished', function(e, data){
		var boxOutside = $(data.movingBoxs[data.movingBoxs.length-1]),
			boxInside  = data.hiddenBox;
		
		data.parent.boxes.hidden  = data.parent.replaceFrom(data.parent.boxes.hidden, boxInside, boxOutside);
		data.parent.boxes.visible = data.parent.replaceFrom(data.parent.boxes.visible, boxOutside, boxInside);
		data.parent.resetHiddenBoxsPositions();
		
	});
};

qbox.prototype.initTimer = function(){
	this.timer = null;
	if($(this.options.box.selector, this.target).length > this.options.box.displayed){
		
		var callback = function(qBoxInstance){
			qBoxInstance.slideBoxes(qBoxInstance.getSlidePosition());
        };
		this.timer = new qtime(callback, this, this.options.qtime);
	}	
};

qbox.prototype.resetHiddenBoxsPositions = function(e, data){
	$(this.boxes.hidden).each(function(index,box){
		$(box).css({
			'left'     : '-3000px',
			'top'      : '-3000px'
		});
	});	
};

/***** outside box methods (sliding boxes) *****/

qbox.prototype.getSlidePosition = function(){
	var position = 0;
	var nbSlidePosition = this.boxes.outside.active.length;
	
	if(typeof this.options.slide.custom == 'function')
	{
		position = this.options.slide.custom.call(this);
	}
	else {
		switch(this.options.slide.by) {
			case 'random':
				position = Math.floor(Math.random()* nbSlidePosition);
			    break;
			case 'desc':
				this.boxes.outside.current = this.boxes.outside.current-1 < 0 
										   ? nbSlidePosition-1 
										   : this.boxes.outside.current-1; 
				position = this.boxes.outside.current;
			    break;
			default: 
			case 'asc':
				this.boxes.outside.current = this.boxes.outside.current+1 > nbSlidePosition-1 
										   ? 0 
										   : this.boxes.outside.current+1;
				position = this.boxes.outside.current;
			    break;
		}
	}
	
	return position;
};

qbox.prototype.slideBoxes = function(outsideIndex){
	var done = false;
	if(typeof this.boxes.outside.active[outsideIndex] == 'object'){
		var hiddenBox        = $(this.boxes.hidden[Math.floor(Math.random()*this.boxes.hidden.length)]),
			outsideBoxParams = this.boxes.outside.active[outsideIndex],
			element          = null,
			movingBox        = null,
			prevMovingBox    = null,
			movingBoxs       = [hiddenBox[0]],
			col              = 0,
			row              = 0,
			animation        = {};
		
		hiddenBox.css({ 	
			left: outsideBoxParams.pos.left,
			top:  outsideBoxParams.pos.top
		});
			
		            
		for(i=0;i<outsideBoxParams.rows.length;i++){
			col        = outsideBoxParams.cols[i];
			row        = outsideBoxParams.rows[i];
			movingBox  = this.boxes.displayed[row][col];
			
			movingBoxs.push(movingBox);
			this.boxes.displayed[row][col] = prevMovingBox != null ? prevMovingBox : hiddenBox[0];
			prevMovingBox = movingBox;
		}
		
		for(var index=0;index<movingBoxs.length;index++){
			element = movingBoxs[index];
			
			switch(outsideBoxParams.anim){
				case 'left':
					animation = {'left' : (parseInt(eval($(element).position().left + outsideBoxParams.move))) + 'px'};
					break;
				case 'top':
					animation = {'top' : (parseInt(eval($(element).position().top + outsideBoxParams.move))) + 'px'};
					break;
			}
			
			var p = this;
			$(element).animate(animation, this.options.slide.duration, this.options.slide.effect, function(){
				p.endedAnimation++;
				if(p.endedAnimation >= movingBoxs.length){
					$(p).trigger('boxsAnimationFinished',{parent:p, movingBoxs: movingBoxs,  hiddenBox: hiddenBox});
					p.endedAnimation = 0;
					done = true;
				}
			});
		}	
	} 
	return done;
};

/***** useful methods *****/

qbox.prototype.walkBoxesMatrice = function(func){
	
	for(var row=0;row<this.boxes.displayed.length;row++){
		for(var col=0;col<this.boxes.displayed[row].length;col++){
			func(row, col, this.boxes.displayed[row][col]);
		}
	}
};

qbox.prototype.replaceFrom = function(elements, addedElement, removedElement){
	for(var index=0;index<elements.length;index++){
		if($(elements[index]).data('uid') == $(addedElement).data('uid')){
			elements.splice(index, 1, removedElement[0]);
		}
	}
	return elements;
};

/***** Debug methods *****/

qbox.prototype.switchOutsidePositionsDisplay = function(){
	var debugDivs = $('div.debug-boxs', this.target), show = false;
	
	if(debugDivs.length > 0){
		if(debugDivs.css('display') != 'none'){
			$(debugDivs).css({'display': 'none'});
		}
		else 
		{
			$(debugDivs).css({'display': 'block'});
			show = true;
		}
	}
	else {
		this.showOutsidePositions();
		show = true;
	}
	return show;
};

qbox.prototype.showOutsidePositions = function(){
	var cssProperties = {
			position: 'absolute',
			width:  this.options.box.width - 7,
			height: this.options.box.width - 7,
			border: '2px solid #900',
			background: '#daa',
			padding: '5px',
			zIndex: '1000'
				
		}, text = '', outsideObj = null;
	
	
	for(var index=0;index<this.boxes.outside.active.length;index++){
		outsideObj = this.boxes.outside.active[index];
		text = index;
		/*
		text = '<strong>' + index + '</strong><br />anim:' + outsideObj.anim + '<br />move:' + outsideObj.move;
		
		text += '<br />cols: ';
		$(outsideObj.cols).each(function(){ text += this + '|'; });
		
		text += '<br />rows:';
		$(outsideObj.rows).each(function(){ text += this + '|'; });
		*/
		$('<div>').css($.extend({
			left:  outsideObj.pos.left,
			top:   outsideObj.pos.top
		}, cssProperties)).addClass('debug-boxs').html(text).prependTo($(this.target));
		
	}
};




/*****
 * add qBox to jQuery tools + attach qbox instance to his target 
 * 
 * @param {Object} options
 */
$.fn.qbox = function (options){
	var qboxInstance = null;
	
	this.each(function(){
		if(null == $(this).data('qbox')){
			qboxInstance = new qbox(this, options);
			$(this).data('qbox', qboxInstance);
		}
		else {
			qboxInstance = $(this).data('qbox');
		}
	});
	return qboxInstance;
};

