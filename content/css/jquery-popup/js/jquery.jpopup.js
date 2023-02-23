/**
 * @license
 *
 * jPopup v2.0.0
 * http://jpopup.seapip.com
 
 * Copyright Thomas Gladdines
 * http://jpopup.seapip.com/LICENSE
 */
function jPopup(config) {
	//Default options
	var defaults = $.extend(true, {}, jPopup.options);
	
	//Generate unique id
	do {
		this.id = Math.random().toString(36).substr(2, 8)+new Date().getTime().toString(36);
	} while(!this.id || this.id.length != 16);
	
	//Private variables of all plugins
	this.___vars = {};
	
	//Function overrides
	function overrides(overrideK, protoK, selfK, name, proto, self, key) {
		if (typeof overrideK === "function") {
			$.each(proto, function(k, v) {
				if(proto != jPopup.prototype && k != key && !name & !self.hasOwnProperty(k)) {
					self[k] = function() {
						return v.apply(this, arguments);
					};
				}
			});
			self[key] = function() {
				
				//Original arguments
				var a = arguments;

				//Original function
				this._super = function() {
					return protoK.apply(this, a);
				};
				
				if(name) {
					//Public methods
					if("methods" in jPopup.plugins[name]) {
						this._methods = jPopup.plugins[name].methods;
					}
					
					//Public variables
					if("vars" in jPopup.plugins[name]) {
						this._vars = jPopup.plugins[name].vars;
					}
					
					//Private variables
					if(!(name in this.___vars)) {
						this.___vars[name] = {test: 123};
					}
					this.__vars = this.___vars[name];
				}
				
				
				//Custom function
				return overrideK.apply(this, a);
			};
		} else {
			for(key in overrideK) {
				if(!selfK.hasOwnProperty(key)) {
					selfK[key] = {};
				}
				overrides(overrideK[key], protoK[key], selfK[key], name, protoK, selfK, key);
			}
		}
	}
	
	//Apply plugins
	var self = this;
	if(!jPopup.loaded) {
		jPopup.loaded = true;
		for(name in jPopup.plugins) {
			//Override functions with plugin functions
			overrides(jPopup.plugins[name].overrides, jPopup.prototype, jPopup.prototype, name);
		}
	}
	
	//Add plugin methods
	this.plugins = {};
	for(name in jPopup.plugins) {
		if(jPopup.plugins[name].methods) {
			this.plugins[name] = jPopup.plugins[name].methods.bind(this);
		}
	}
	
	//Load plugin defaults in config
	for(name in jPopup.plugins) {
		defaults.plugins[name] = jPopup.plugins[name].defaults;
	}
	
	//Apply options to config
	this._config = $.extend(true, defaults, config);
	
	//Override functions with config functions
	overrides(this._config.overrides, jPopup.prototype, this);
	
	//Generate html elements
	var elements = $("<div><div class=\"jp_overlay\" style=\"position:fixed;top:0;left:0;bottom:0;right:0;display:none;\"></div><div class=\"jp_wrapper\" style=\"position:fixed;top:-9999px;left:-9999px;\"><form class=\"jp_popup\" style=\"position:absolute;float:left;\" tabindex=\"0\"><header class=\"jp_title\"></header><section class=\"jp_content\"></section><footer class=\"jp_buttons\"></footer><button class=\"jp_close\" style=\"position:absolute;top:0;right:0;width:20px;height:20px;\"></button><div class=\"jp_resize\" style=\"display:none;\"><div style=\"position:absolute;top:0;left:0;right:0;height:6px;cursor:n-resize;\"></div><div style=\"position:absolute;top:0;left:0;bottom:0;width:6px;cursor:w-resize;\"></div><div style=\"position:absolute;left:0;bottom:0;right:0;height:6px;cursor:s-resize;\"></div><div style=\"position:absolute;top:0;bottom:0;right:0;width:6px;cursor:e-resize;\"></div><div style=\"position:absolute;top:0;left:0;width:6px;height:6px;cursor:nw-resize;\"></div><div style=\"position:absolute;top:0;right:0;width:6px;height:6px;cursor:ne-resize;\"></div><div style=\"position:absolute;left:0;bottom:0;width:6px;height:6px;cursor:sw-resize;\"></div><div style=\"position:absolute;bottom:0;right:0;width:6px;height:6px;cursor:se-resize;\"></div></div></form></div></div>");
	this.elements = {};
	this.elements.overlay = elements.children(".jp_overlay");
	this.elements.wrapper = elements.children(".jp_wrapper");
	this.elements.popup =  this.elements.wrapper.children(".jp_popup");
	this.elements.title = this.elements.popup.children(".jp_title");
	this.elements.content = this.elements.popup.children(".jp_content");
	this.elements.buttons = this.elements.popup.children(".jp_buttons");
	this.elements.close = this.elements.popup.children(".jp_close");
	this.elements.resize = this.elements.popup.children(".jp_resize");
	
	//Call create function
	this._create();
	
	return this;
}

jPopup.options = {
	title: "",
	content: "",
	buttons: [],
	closeButtonContent: "&#215;",
	closeButton: false,
	overlay: true,
	overlayClose: false,
	position: "center",
	offset: {
		x: 0,
		y: 0
	},
	speed: 300,
	animations: {
		open: {
			center: function() {
				this._animations.zoomIn.call(this);
			},
			top: function() {
				this._animations.zoomIn.call(this);
			},
			left: function() {
				this._animations.zoomIn.call(this);
			},
			bottom: function() {
				this._animations.zoomIn.call(this);
			},
			right: function() {
				this._animations.zoomIn.call(this);
			},
			topLeft: function() {
				this._animations.zoomIn.call(this);
			},
			topRight: function() {
				this._animations.zoomIn.call(this);
			},
			bottomLeft: function() {
				this._animations.zoomIn.call(this);
			},
			bottomRight: function() {
				this._animations.zoomIn.call(this);
			},
			stretchTop: function() {
				this._animations.zoomIn.call(this);
			},
			stretchLeft: function() {
				this._animations.zoomIn.call(this);
			},
			stretchBottom: function() {
				this._animations.zoomIn.call(this);
			},
			stretchRight: function() {
				this._animations.zoomIn.call(this);
			},
			full: function() {
				this._animations.zoomIn.call(this);
			}
		},
		close: {
			center: function() {
				this._animations.zoomOut.call(this);
			},
			top: function() {
				this._animations.zoomOut.call(this);
			},
			left: function() {
				this._animations.zoomOut.call(this);
			},
			bottom: function() {
				this._animations.zoomOut.call(this);
			},
			right: function() {
				this._animations.zoomOut.call(this);
			},
			topLeft: function() {
				this._animations.zoomOut.call(this);
			},
			topRight: function() {
				this._animations.zoomOut.call(this);
			},
			bottomLeft: function() {
				this._animations.zoomOut.call(this);
			},
			bottomRight: function() {
				this._animations.zoomOut.call(this);
			},
			stretchTop: function() {
				this._animations.zoomOut.call(this);
			},
			stretchLeft: function() {
				this._animations.zoomOut.call(this);
			},
			stretchBottom: function() {
				this._animations.zoomOut.call(this);
			},
			stretchRight: function() {
				this._animations.zoomOut.call(this);
			},
			full: function() {
				this._animations.zoomOut.call(this);
			}
		}
	},
	stickToBottom: true,
	closeKeys: [],
	classes: "",
	freeze: true,
	plugins: {},
	overrides: {},
	mediaqueries: true
};

jPopup.loaded = false;
jPopup.zIndex = 10000;
jPopup.instances = {};
jPopup.plugins = {};

jPopup._super = function(self) {
	return self._super.apply(self);
};

jPopup.button = function(config) {
	var defaults = {
		name: "",
		text: "",
		value: null,
		classes: "",
		disabled: false,
		hidden: false,
		close: true,
		onclick: null
	};
	this._config = $.extend(true, defaults, config);
	this._parents = [];
};

jPopup.button.prototype = {
	name: function(name) {
		if(!arguments.length) {
			return this._config.name;
		}
		this._config.name = name;
		return this;
	},
	text: function(text) {
		if(text) {
			this._config.text = text;
			this._elements(function() {
				this.html(text);
			});
			return this;
		} else {
			return this._config.text;
		}
	},
	value: function(value) {
		if(!arguments.length) {
			return this._config.value;
		}
		this._config.value = value;
		return this;
		
	},
	classes: function(classes) {
		if(classes) {
			classes = jPopup.prototype._unique(classes.split(" ")).join(" ");
			this._config.classes = classes;
			this._elements(function() {
				this.attr("class", classes);
			});
			return this;
		} else {
			return this._config.classes;
		}
	},
	addClass: function(c) {
		var classes = this._config.classes.split(" ");
		classes.push(c);
		this._config.classes = jPopup.prototype._unique(classes).join(" ");
		this._elements(function() {
			this.addClass(c);
		});
		return this;
	},
	removeClass: function(c) {
		var classes = this._config.classes.split(" ");
		var i = jPopup.prototype._inArray(c, classes);
		if(i.length) {
			classes.splice(i, 1);
			this._config.classes = jPopup.prototype._unique(classes).join(" ");
			this._elements(function() {
				this.removeClass(c);
			});
		}
		return this;
	},
	remove: function() {
		var self = this;
		this._elements(function(x, y) {
			this.remove();
			self._parents[x]._config.buttons.splice(y, 1);
		});
		return this;
	},
	disable: function() {
		this._elements(function() {
			this.attr("disabled","");
		});
		return this;
	},
	enable: function() {
		this._elements(function() {
			this.removeAttr("disabled");
		});
		return this;
	},
	close: function(close) {
		if(!arguments.length) {
			return this._config.close;
		}
		this._config.close = close;
		return this;
	},
	hide: function() {
		this._elements(function() {
			this.hide();
		});
		return this;
	},
	show: function() {
		this._elements(function() {
			this.show();
		});
		return this;
	},
	move: function(position, absolute) {
		var a = arguments.length;
		var self = this;
		var positions = [];
		this._elements(function(x, y) {
			if(a) {
				var element = self._parents[x].elements.buttons.children().eq(y);
				var config = self._parents[x]._config.buttons;
				var z = absolute ? position : y + position;
				z = z > 0 ? z : 0;
				z = z < config.length ? z : config.length - 1;
				var target = self._parents[x].elements.buttons.children().eq(z);
				if(y - z < 0) {
					target.after(element);
				} else {
					target.before(element);
				}
				config.splice(z, 0, config.splice(y, 1)[0]);
			} else {
				positions.push({
					parent: x,
					position: y
				});
			}
		});
		return positions;
	},
	onclick: function(onclick) {
		if(!arguments.length) {
			return this._config.onclick;
		}
		this._config.onclick = onclick;
		return this;
	},
	clone: function() {
		return new jPopup.button(this._config);
	},
	_elements: function(method) {
		var elements = [];
		for(var x = 0; x < this._parents.length; x++) {
			var m = jPopup.prototype._inArray(this, this._parents[x].buttons());
			for(var y = 0; y < m.length; y++) {
				var element = this._parents[x].elements.buttons.children().eq(m[y]);
				elements.push(element);
				if(method) {
					method.call(element, x, m[y]);
				}
			}
		}
		return elements;
	}
};

jPopup.prototype = {
	_create: function() {
		//Apply config
		this.title(this._config.title);
		this.content(this._config.content);
		this.buttons(this._config.buttons);
		this.closeButton(this._config.closeButton);
		this.closeButtonContent(this._config.closeButtonContent);
		this.classes(this._config.classes);
	},
	open: function(method) {		
		var self = this;
		
		//Add popup to instances
		jPopup.instances[this.id] = this;
		
		//Add overlay and wrapper to document body
		$("body").append(this.elements.overlay);
		$("body").append(this.elements.wrapper);

		//Temporarily save offset to variable
		var offset = this._config.offset;
		
		//Set position
		this.position(this._config.position);
		
		//Set offset
		this.offset(offset);

		//Set z-index
		this._zIndex();
		
		//Set overlay
		this.overlay(this._config.overlay);
		
		//Freeze
		this.freeze(this._config.freeze);		
		
		//Animate
		this._config.animations.open[this._config.position].call(this);
		
		//Button click
		this.elements.popup.on("click", "button", function(e) {
			if($.contains(self.elements.buttons[0], this)) {
				e.preventDefault();
				var button = self._config.buttons[$(this).index()];
				if(button.close()) {
					self.close();
				}
				if(button._config.onclick) {
					button._config.onclick.call(self);
				}
				if(method) {
					method.call(self, button.value());
				}
			}
		});
		
		//Prevent form submission
		this.elements.popup.on("submit", function(e) {
			e.preventDefault();
		});
		
		//Close button click
		this.elements.close.on("click", function(e) {
			e.preventDefault();
			self.close();
		});
		
		//Overlay click
		this.elements.overlay.on("click", function() {
			if(self._config.overlayClose) {
				self.close();				
			}
		});
		
		//Focus on popup
		this.elements.popup.focus();
		
		$(document).on("keydown.jp_"+this.id, function (e) { 
			//Keep tab key inside popup
			if(e.which == 9) {
				if(!$.contains(self.elements.popup[0], document.activeElement)) {
					self.elements.popup.focus();
				}
			}
			//Close key
			if(self._inArray(e.which, self._config.closeKeys).length && self.elements.wrapper.is(":last-child")) {
				self.close();
			}
		});
		
		//Mediaqueries
		$(window).on("resize.jp_"+this.id, function () { 
			var width = self.elements.popup.outerWidth();
			if(self._config.mediaqueries && width != self._mediaqueries) {
				if(self._mediaqueries) {
					if(self._config.position == "center" || self._config.position == "top" || self._config.position == "bottom") {
						self.elements.popup.offset({
							left: self.elements.popup.offset().left + ((self._mediaqueries - width) / 2)
						});
					}
					if(self._config.position == "right" || self._config.position == "topRight" || self._config.position == "bottomRight" || self._config.position == "stretchRight") {
						self.elements.popup.offset({
							left: self.elements.popup.offset().left + self._mediaqueries - width
						});
					}
				}
				self._mediaqueries = width;
			}
		});
		
		return this;
	},
	close: function() {
		//Hide overlay
		this._overlay.hide.call(this);
		
		//Unfreeze
		this.freeze(false, true);
		
		//Animate
		this._config.animations.close[this._config.position].call(this);
		
		var self = this;
		setTimeout(function() {
			//Trigger animationend in case the wrapper might be removed too soon for custom animations to trigger animationend
			self.elements.popup.trigger("animationend");
			
			//Remove form submission event
			self.elements.popup.off("submit");
			
			//Remove overlay and wrapper from document body
			self.elements.overlay.remove();
			self.elements.wrapper.remove();
			
		}, this._config.speed);
		
		//Remove buttons click event
		this.elements.popup.off("click");
		
		//Remove close button click event
		this.elements.close.off("click");
		
		//Remove overlay click event
		this.elements.overlay.off("click");
		
		//Remove tab and close key event
		$(document).off("keydown.jp_"+this.id);
		
		//Remove mediaqueries resize event
		$(window).off("resize.jp_"+this.id);
		
		//Remove popup from instances
		delete jPopup.instances[this.id];
		
		return this;
	},
	title: function(title) {
		if(arguments.length) {
			//Apply new title to config
			this._config.title = title;
			
			//Add title html to title
			this.elements.title.html(title);
			
			if(title) {
				this.elements.popup.prepend(this.elements.title);
			} else {
				this.elements.title.remove();
			}
			
			return this;
		} else {
			return this._config.title;
		}
	},
	content: function(content) {
		if(arguments.length) {
			//Apply new content to config
			this._config.content = content;
			
			//Add content html to content
			this.elements.content.html(content);
			
			if(content) {
				if($.contains(this.elements.popup[0], this.elements.title[0])) {
					this.elements.title.after(this.elements.content);
				} else {
					this.elements.popup.prepend(this.elements.content);
				}
			} else {
				this.elements.content.remove();
			}
			
			return this;
		}
		return this._config.content;
	},
	buttons: function(buttons) {
		var self = this;
		this.buttons.add = function(button) {
			if(!(button instanceof jPopup.button)) {
				button = new jPopup.button(button);
			}
			self._config.buttons.push(button);
			self.elements.buttons.append($("<button>"));
			button._parents.push(self);
			button.text(button._config.text);
			button.classes(button._config.classes);
			if(button._config.disabled) {
				button.disable();
			}
		}
		if($.isArray(buttons)) {
			//Apply new buttons to config
			this._config.buttons = buttons;
			
			//Loop trough config buttons and add buttons to popup
			this.elements.buttons.html("");
			for(var x = 0; x < this._config.buttons.length; x++) {
				var button = this._config.buttons[x];
				if(!(button instanceof jPopup.button)) {
					button = new jPopup.button(button);
					this._config.buttons[x] = button;
				}
				this.elements.buttons.append($("<button>"));
				button._parents.push(this);
				button.text(button._config.text);
				button.classes(button._config.classes);
				if(button._config.disabled) {
					button.disable();
				}
			}
			
			if(this.elements.buttons.html()) {
				if($.contains(this.elements.popup[0], this.elements.close[0])) {
					this.elements.close.before(this.elements.buttons);
				} else {
					this.elements.popup.append(this.elements.buttons);
				}
			} else {
				this.elements.buttons.remove();
			}
			
			return this;
		} else if(typeof buttons === "string") {
			for(var x = 0; x < this._config.buttons.length; x++) {
				var button = this._config.buttons[x];
				if(button.name == buttons) {
					return button;
				}
			}
		} else if(buttons % 1 == 0) {
			return this._config.buttons[buttons];
		}
		return this._config.buttons;
	},
	closeButton: function(close) {
		if(arguments.length) {
			//Apply close button to config
			this._config.closeButton = close ? true : false;
			
			//Add/remove close button from popup
			if(close) {
				this.elements.popup.append(this.elements.close);
			} else {
				this.elements.close.remove();
			}
			
			return this;
		}
		return this._config.closeButton;
	},
	closeButtonContent: function(content) {
		if(arguments.length) {
			//Apply new close button content to config
			this._config.closeButtonContent = content;
			
			//Add close button html to close button
			this.elements.close.html(content);
			
			return this;
		}
		return this._config.closeButtonContent;
	},
	overlay: function(overlay) {
		if(arguments.length) {
			//Apply new overlay to config
			this._config.overlay = overlay ? true : false;
			
			//Show/hide overlay
			if(overlay) {
				this._overlay.show.call(this);
			} else {
				this._overlay.hide.call(this);
			}
			
			return this;
		}
		return this._config.overlay;
	},
	_overlay: {
		show: function() {
			var self = this;
			var speed = this._config.speed;
			
			//Animation start
			this.elements.overlay.css({"display": "block", "opacity": 0})
			
			//Animation end
			setTimeout(function() {
				self.elements.overlay.css({"opacity": "1", "transition": "opacity "+speed+"ms"});
			}, 10);
		},
		hide: function() {
			var self = this;
			var speed = this._config.speed;
			
			//Animation start
			this.elements.overlay.css({"opacity": 0, "transition": "opacity "+speed+"ms"});
			
			//Animation end
			setTimeout(function() {
				self.elements.overlay.hide();
			}, speed);
		}
	},
	overlayClose: function(overlayClose) {
		if(arguments.length) {
			//Apply new overlayClose to config
			this._config.overlayClose = overlayClose ? true : false;
			return this;
		}
		return this._config.overlayClose;
	},
	closeKeys: function(closeKeys) {
		if(arguments.length) {
			//Apply new closeKeys to config
			this._config.closeKeys = closeKeys;
			return this;
		}
		return this._config.closeKeys;
		
	},
	freeze: function(freeze, config) {
		if(arguments.length) {
			var frozen;
			var count = 0;
			for(id in jPopup.instances) {
				var instance = jPopup.instances[id];
				if(instance.freeze()) {
					frozen = true;
					count++;
				}
			}
			
			if(freeze && (!frozen || count == 1)) {
				this._freeze();
			} else if(!freeze && frozen && count == 1) {
				this._unfreeze();
			}
			
			if(!config) {
				this._config.freeze = freeze ? true : false;
			}
			
			return this;
		}
		return this._config.freeze;
	},
	_freeze: function() {
		var top = $(document).scrollTop();
		var left = $(document).scrollLeft();
		if(window.innerWidth > document.documentElement.clientWidth) {
			$("html").css("overflow-y", "scroll");
		}
		$("html").css({"width": "100%", "height": "100%", "position": "fixed", "top": -top, "left": -left});
	},
	_unfreeze: function() {
		$("html").css("position", "static");
		$("html, body").scrollTop(-parseInt($("html").css("top")));
		$("html, body").scrollLeft(-parseInt($("html").css("left")));
		$("html").css({"position": "", "width": "", "height": "", "top": "", "left": "", "overflow-y": "", "overflow-x": ""});
	},
	form: function() {
		return this.elements.popup;
	},
	position: function(position, offset) {
		if(arguments.length) {
			//Apply new position to config
			this._config.position = position;
			
			//Reset offset
			this._config.offset = {
				x: 0,
				y: 0
			}
			
			//Apply position to popup
			switch(this._config.position) {
				case "center":
					this.elements.wrapper.css({"width": 0, "height": 0, "position": "fixed", "top": "50%", "left": "50%", "bottom": "", "right": ""});
					this.elements.popup.css({"width": "", "height": "", "position": "relative", "top": -this.elements.popup.outerHeight() / 2, "left": -this.elements.popup.outerWidth() / 2, "bottom": ""});
					break;
				case "top":
					this.elements.wrapper.css({"width": 0, "height": 0, "position": "fixed", "top": 0, "left": "50%", "bottom": "", "right": ""});
					this.elements.popup.css({"width": "", "height": "", "position": "relative", "top": 0, "left": -this.elements.popup.outerWidth() / 2, "bottom": ""});
					break;
				case "left":
					this.elements.wrapper.css({"width": 0, "height": 0, "position": "fixed", "top": "50%", "left": 0, "bottom": "", "right": ""});
					this.elements.popup.css({"width": "", "height": "", "position": "relative", "top": -this.elements.popup.outerHeight() / 2, "left": 0, "bottom": ""});
					break;
				case "bottom":
					this.elements.wrapper.css({"width": 0, "height": 0, "position": "fixed", "top": "", "left": "50%", "bottom": 0, "right": ""});
					if((this._config.position == "bottom" || this._config.position == "bottomLeft" || this._config.position == "bottomRight" || this._config.position == "stretchBottom") && !this._config.draggable) {
						this.elements.popup.css({"position": "absolute", "top": "", "left": -this.elements.popup.outerWidth() / 2, "bottom": 0});
					} else {
						this.elements.popup.css({"width": "", "height": "", "position": "relative", "top": -this.elements.popup.outerHeight(), "left": -this.elements.popup.outerWidth() / 2, "bottom": ""});
					}
					break;
				case "right":
					this.elements.wrapper.css({"width": 0, "height": 0, "position": "fixed", "top": "50%", "left": "", "bottom": 0, "right": 0});
					this.elements.popup.css({"width": "", "height": "", "position": "relative", "top": -this.elements.popup.outerHeight() / 2, "left": -this.elements.popup.outerWidth(), "bottom": ""});
					break;
				case "topLeft":
					this.elements.wrapper.css({"width": 0, "height": 0, "position": "fixed", "top": 0, "left": 0, "bottom": "", "right": ""});
					this.elements.popup.css({"width": "", "height": "", "position": "relative", "top": 0, "left": 0, "bottom": ""});
					break;
				case "topRight":
					this.elements.wrapper.css({"width": 0, "height": 0, "position": "fixed", "top": 0, "left": "", "bottom": "", "right": 0});
					this.elements.popup.css({"width": "", "height": "", "position": "relative", "top": 0, "left": -this.elements.popup.outerWidth(), "bottom": ""});
					break;
				case "bottomLeft":
					this.elements.wrapper.css({"width": 0, "height": 0, "position": "fixed", "top": "", "left": 0, "bottom": 0, "right": ""});
					if(this._config.stickToBottom && !this._config.draggable) {
						this.elements.popup.css({"position": "absolute", "top": "", "left": 0, "bottom": 0});
					} else {
						this.elements.popup.css({"width": "", "height": "", "position": "relative", "top": -this.elements.popup.outerHeight(), "left": 0, "bottom": ""});
					}
					break;
				case "bottomRight":
					this.elements.wrapper.css({"width": 0, "height": 0, "position": "fixed", "top": "", "left": "", "bottom": 0, "right": 0});
					if(this._config.stickToBottom && !this._config.draggable) {
						this.elements.popup.css({"position": "absolute", "top": "", "left": -this.elements.popup.outerWidth(), "bottom": 0});
					} else {
						this.elements.popup.css({"width": "", "height": "", "position": "relative", "top": -this.elements.popup.outerHeight(), "left": -this.elements.popup.outerWidth(), "bottom": ""});
					}
					break;
				case "stretchTop":
					this.elements.wrapper.css({"width": "100%", "height": 0, "position": "fixed", "top": 0, "left": 0, "bottom": "", "right": ""});
					this.elements.popup.css({"width": "100%", "height": "", "position": "relative", "top": 0, "left": 0, "bottom": ""});
					break;
				case "stretchLeft":
					this.elements.wrapper.css({"width": 0, "height": "100%", "position": "fixed", "top": 0, "left": 0, "bottom": "", "right": ""});
					this.elements.popup.css({"width": "", "height": "100%", "position": "relative", "top": 0, "left": 0, "bottom": ""});
					break;
				case "stretchBottom":
					this.elements.wrapper.css({"width": "100%", "height": 0, "position": "fixed", "top": "", "left": 0, "bottom": 0, "right": ""});
					if(this._config.stickToBottom && !this._config.draggable) {
						this.elements.popup.css({"width": "100%", "height": "", "position": "absolute", "top": "", "left": 0, "bottom": 0});
					} else {
						this.elements.popup.css({"width": "100%", "height": "", "position": "relative", "top": "", "left": 0, "bottom": ""});
					}
					break;
				case "stretchRight":
					this.elements.wrapper.css({"width": 0, "height": "100%", "position": "fixed", "top": 0, "left": "", "bottom": "", "right": 0});
					this.elements.popup.css({"width": "", "height": "100%", "position": "relative", "top": 0, "left": -this.elements.popup.outerWidth(), "bottom": ""});
					break;
				case "full":
					this.elements.wrapper.css({"width": "100%", "height": "100%", "position": "fixed", "top": 0, "left": 0, "bottom": "", "right": ""});
					this.elements.popup.css({"width": "100%", "height": "100%", "position": "relative", "top": 0, "left": 0, "bottom": ""});
			}
			
			return this;
		}
		return this._config.position;
	},
	offset: function(offset) {
		if(arguments.length) {
			var position = this.position();
			if(this.position() != "stretchTop"  && this.position() != "stretchLeft" && this.position() != "stretchBottom" && this.position() != "stretchRight") {
				var popup = this.elements.popup;
				
				//Get current popup offset
				var top = popup.offset().top;
				var left = popup.offset().left;
				
				//If undefined set values to 0
				offset = {
					x: offset.x || 0,
					y: offset.y || 0
				};
				
				//Calculate new popup offset
				var offsetTop = top - offset.y;
				var offsetLeft = left + offset.x;
				
				//Top boundary
				if(offsetTop - $(window).scrollTop() < 0) {
					offset.y = 0;
					offsetTop = 0;
				}
				//Bottom boundary
				if($(window).height() - offsetTop - popup.outerHeight() + $(window).scrollTop() < 0) {
					offset.y = 0;
					offsetTop = $(window).height() - popup.outerHeight() + $(window).scrollTop();
				}
				
				//Left boundary
				if(offsetLeft < 0) {
					offset.x = 0;
					offsetLeft = 0;
				}
				
				//Right boundary
				if($(window).width() - offsetLeft - popup.outerWidth() < 0) {
					offset.x = 0;
					offsetLeft = $(window).width() - popup.outerWidth();
				}
				
				//Set new offset in config
				this._config.offset = {
					x: this._config.offset.x + offset.x,
					y: this._config.offset.y + offset.y
				}
				
				//Apply new offset to popup
				popup.offset({
					top: offsetTop,
					left: offsetLeft
				});
			}
			
			return this;
		}
		return this._config.offset;
	},
	clone: function() {
		return new jPopup(this._config);
	},
	clear: function() {
		this.elements.popup[0].reset();
		return this;
	},
	classes: function(classes) {
		if(arguments.length) {
			classes = this._unique(classes.split(" ")).join(" ");
			this._config.classes = classes;
			this.elements.overlay.addClass(classes);
			this.elements.wrapper.addClass(classes);
			
			return this;
		}
		
		return this._config.classes;
	},
	addClass: function(c) {
		var classes = this._config.classes.split(" ");
		classes.push(c);
		this._config.classes = this._unique(classes).join(" ");
		this.elements.overlay.addClass(c);
		this.elements.wrapper.addClass(c);
		
		return this;
	},
	removeClass: function(c) {
		var classes = this._config.classes.split(" ");
		var i = this._inArray(c, classes);
		if(i.length) {
			classes.splice(i, 1);
			this._config.classes = this._unique(classes).join(" ");
			this.elements.overlay.removeClass(c);
			this.elements.wrapper.removeClass(c);
		}
		
		return this;
	},
	_zIndex: function() {
		//Set z-index
		this.elements.overlay.css("z-index", jPopup.zIndex);
		this.elements.wrapper.css("z-index", jPopup.zIndex);
	},
	_animations: {
		zoomIn: function() {
			var self = this;
			var speed = this._config.speed;
			
			//Animation start
			this.elements.popup.css({"opacity": 0, "transform": "scale(.8)"});
			
			setTimeout(function() {
				//Animation end
				self.elements.popup.css({"opacity": "1", "transform": "scale(1)", "transition": "opacity "+speed+"ms, transform "+speed+"ms"});
				self._animations._clean.apply(self);
			}, 10);
		},
		zoomOut: function() {
			var speed = this._config.speed;
			
			//Animation end
			this.elements.popup.css({"opacity": 0, "transform": "scale(.8)", "transition": "opacity "+speed+"ms, transform "+speed+"ms"});
			this._animations._clean.call(this);
		},
		_clean: function() {
			//Remove animation css when finished
			var self = this;
			setTimeout(function() {
				self.elements.popup.css({"opacity": "", "transform": "", "transition": ""});
			}, this._config.speed);
		}
	},
	_inArray: function(value, array) {
		var matches = [];
		var match = -1;
		do {
			match = $.inArray(value, array, match + 1);
			matches.push(match);
		} while (match > -1);
		matches.splice(-1, 1);
		return matches;
	},
	_unique: function(array) {
		return $.grep(array, function(el, index) {
			return index === $.inArray(el, array);
		});
	}
};