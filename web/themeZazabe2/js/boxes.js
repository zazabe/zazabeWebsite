var boxes = function (options){
	
	this.options = $.extend({
		container: $('#boxes'),
		effect: 'linear',
		duration: 1000,
		interval: 5000,
		boxHeight: $('#boxes li').outerHeight(true),
		boxWidth: $('#boxes li').outerWidth(true)
	}, options);
	
	this.endedAnimation = 0;
	
	//boxes object is composed of arrays:
	// - displayed          = matrice of boxes
	// - visible            = list of visible boxes
	// - hidden             = list of hidden boxes
	// - outside            = list of outside possible position for hidden boxes
	//   - pos.left/pos.top = pixel position 
	this.boxes = this.setupBoxes();
		
	//repositioning boxesObjects to display
	this.initBoxesPosition();
	
	//define outside graphical position
	this.defineOutsidesPosition();
	
	var boxesWrap = this;
	if($('li', this.options.container).length > 9){
		this.timer = setInterval(function(){
			boxesWrap.slideBoxes(Math.floor(Math.random()*12));
		}, this.options.interval);
	}
}



boxes.prototype.setupBoxes = function(){
	
	//define elements as box matrice, who is hidden or not...
	var els          = $('li', this.options.container), 
	    pos_el       = 0,
		pos_x        = 0, 
	    pos_y        = 0,
	    boxesObjects = {displayed: [[],[],[]], visible: [], hidden: [], outside: []};
	
	for(i=1 ; i < els.length+1 ; i++){
		pos_el = i-1;
		
		if(i <= 9){
			boxesObjects.displayed[pos_x][pos_y] = els[pos_el];
			boxesObjects.visible.push(els[pos_el]);
		}
		else {
			boxesObjects.hidden.push(els[pos_el]);
		}
		pos_x = i%3;
		pos_y = i!=0 && i%3 == 0 ? pos_y+1 : pos_y;
	}
	return boxesObjects;
}

boxes.prototype.initBoxesPosition = function(){
	$('li', this.options.container).css({
		'position' : 'absolute',
		'left'     : -300,
		'top'      : -300
	});
	
	var uid = 0;
	$('li', this.options.container).each(function(i,el){
		$(el).attr('uid', uid++);
	});
	
	var options = this.options;
	
	this.walkBoxesMatrice(function(line, row, box){
		$(box).css({
			'left': options.boxWidth  * line,
			'top' : options.boxHeight * row
		});
	});
	
	$(this).bind('boxsAnimationFinished', function(e, data){
		var boxOutside = $(data.movingBoxs[data.movingBoxs.length-1]),
			boxInside  = data.hiddenBox;
		
		
		data.parent.boxes.hidden  = data.parent.replaceFrom(data.parent.boxes.hidden, boxInside, boxOutside);
		data.parent.boxes.visible = data.parent.replaceFrom(data.parent.boxes.visible, boxOutside, boxInside);
		data.parent.resetHiddenBoxsPositions();
		
	});
	
} 


boxes.prototype.walkBoxesMatrice = function(func){
	
	for(line=0;line<this.boxes.displayed.length;line++){
		for(row=0;row<this.boxes.displayed[line].length;row++){
			func(line, row, this.boxes.displayed[line][row]);
		}
	}
}

boxes.prototype.slideBoxes = function(outsideIndex){
	
	var hiddenBox        = $(this.boxes.hidden[Math.floor(Math.random()*this.boxes.hidden.length)]),
		outsideBoxParams = this.boxes.outside[outsideIndex],
		element          = null,
		movingBox        = null,
		prevMovingBox    = null,
		movingBoxs       = [hiddenBox[0]],
		line             = 0,
		row              = 0,
		animation        = {};
	
	hiddenBox.css({ 	
		left: outsideBoxParams.pos.left,
		top:  outsideBoxParams.pos.top
	});
		
	            
	for(i=0;i<outsideBoxParams.rows.length;i++){
		line       = outsideBoxParams.lines[i];
		row        = outsideBoxParams.rows[i];
		movingBox  = this.boxes.displayed[line][row];
		
		movingBoxs.push(movingBox);
		this.boxes.displayed[line][row] = prevMovingBox != null ? prevMovingBox : hiddenBox[0];
		prevMovingBox = movingBox;
	}
	
	for(var index=0;index<movingBoxs.length;index++){
		element = movingBoxs[index];
		
		switch(outsideBoxParams.anim){
			case 'left':
				animation = {'left' : parseInt(eval($(element).position().left + outsideBoxParams.move))};
				break;
			case 'top':
				animation = {'top' : parseInt(eval($(element).position().top + outsideBoxParams.move))};
				break;
		}
		
		var p = this;
		$(element).animate(animation, this.options.duration, this.options.effect, function(){
			p.endedAnimation++;
			if(p.endedAnimation >= movingBoxs.length){
				$(p).trigger('boxsAnimationFinished',{parent:p, movingBoxs: movingBoxs,  hiddenBox: hiddenBox});
				p.endedAnimation = 0;
			}
		});
	}
}

boxes.prototype.resetHiddenBoxsPositions = function(e, data){
	$(this.boxes.hidden).each(function(index,box){
		$(box).css({
			'left'     : -300,
			'top'      : -300
		});
	});	
}

boxes.prototype.replaceFrom = function(elements, addedElement, removedElement){
	for(var index=0;index<elements.length;index++){
		if($(elements[index]).attr('uid') == $(addedElement).attr('uid')){
			elements.splice(index, 1, removedElement[0]);
		}
	}
	return elements;
}

boxes.prototype.defineOutsidesPosition = function(){
	var outside    = [],
		lastRowId  = this.boxes.displayed.length - 1,
	    lastLineId = this.boxes.displayed[lastRowId].length - 1,
	    options    = this.options;
	
	this.walkBoxesMatrice(function(line, row, box){
		
		var rows = [], lines = [];
		
		
		if(row == 0){
			
			rows = []; lines = [];
			for(i=0;i<=lastRowId;i++){
				lines.push(line);
				rows.push(i);
			}
			outside.push({
				pos : {
					left  : $(box).position().left,
					top   : $(box).position().top - options.boxHeight
				},
				move  : '+' + options.boxHeight,
				rows  : rows,
				lines : lines,
				anim  : 'top'
			});
			
			
		}
		else if(row == lastRowId){
			rows = []; lines = [];
			for(i=lastRowId;i>=0;i--){
				lines.push(line);
				rows.push(i);
			}

			outside.push({
				pos : {
					left  : $(box).position().left,
					top   : $(box).position().top + options.boxHeight
				},
				move  : '-' + options.boxHeight,
				rows  : rows,
				lines : lines,
				anim  : 'top'
			});
		}
		if(line == 0){
			rows = []; lines = [];
			for(i=0;i<=lastLineId;i++){
				lines.push(i);
				rows.push(row);
			}

			outside.push({
				pos : {
					left  : $(box).position().left - options.boxWidth,
					top   : $(box).position().top
				},
				move  : '+' + options.boxWidth,
				rows  : rows,
				lines : lines,
				anim  : 'left'
			});
		}
		else if(line == lastLineId){
			rows = []; lines = [];
			for(i=lastLineId;i>=0;i--){
				lines.push(i);
				rows.push(row);
			}
			outside.push({
				pos : {
					left  : $(box).position().left + options.boxWidth,
					top   : $(box).position().top
				},
				move  : '-' + options.boxWidth,
				rows  : rows,
				lines : lines,
				anim  : 'left'
			});
		}
		
	});
	this.boxes.outside = outside;
}
