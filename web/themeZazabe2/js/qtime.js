/*
 * jQuery qTime plugin : call a function by interval, with pause/resume capacity
 * Version 1.0.0 (23/09/2010)
 * @requires jQuery v1.2.4 or later
 *
 * Copyright (c) 2010 Michel Meyer
 * 
 */
var qtime = function(callback, caller, options){
	if(typeof callback != 'function')
	{
		console.log(typeof callback);
		throw 'qtime callback constructor parameter must be a function';
	}
	
	this.callback = callback;
	this.caller = caller;
	
	this.options = $.extend({
		interval: 1,
		step:     1000,
		running:  true
	}, options);
	
	this.nbCall = 0;
	
	var qtimeWrap = this;
	this.time   = setInterval(function(){
		qtimeWrap.process();
	}, this.options.step); 
};

qtime.prototype.runSwitch = function(){
	return this.isRunning() ? this.pause() : this.resume();
};

qtime.prototype.resume = function(){
	return this.setRunning(true);
};

qtime.prototype.pause = function(){
	return this.setRunning(false);
};

qtime.prototype.isRunning = function(){
	return this.options.running;
};

qtime.prototype.setRunning = function(val){
	this.options.running = val;
	return this;
};


qtime.prototype.process = function(){
	var called = false;

	if(this.isRunning())
	{
		this.nbCall++;
		if(this.options.interval < this.nbCall){
			this.callback(this.caller);
			this.nbCall = 0;
			called = true;
		}
	}
	return called;
};