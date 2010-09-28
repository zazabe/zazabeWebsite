$.fn.colorize = function (options){
	var index = 0;
	
	options = $.extend({
		colors: [ {bg : '#EFA98D',bd : '#6F290D'}, {bg : '#ADA0CA',bd : '#2D204A'}, {bg : '#95BA84',bd : '#153A04'}, 
		          {bg : '#FDB1C1',bd : '#7D3141'}, {bg : '#9BC7CD',bd : '#1B474D'}, {bg : '#879FD2',bd : '#071F52'}, 
		          {bg : '#8DF4AB',bd : '#0D742B'}, {bg : '#CCE08A',bd : '#4C600A'}, {bg : '#BA87B5',bd : '#3A0735'}, 
		          {bg : '#CEBB83',bd : '#4E3B03'}, {bg : '#E7D49C',bd : '#67541C'}, {bg : '#F9999B',bd : '#79191B'} ]
	},options);
	
	this.each(function(){
		index = Math.floor(Math.random() * options.colors.length);
		$(this).css({
			borderColor     : options.colors[index].bd,
			backgroundColor : options.colors[index].bg
		});
	});
	return this;
};