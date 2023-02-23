/**
 * @license
 *
 * jPopup v2.0.0
 * http://jpopup.seapip.com
 
 * Copyright Thomas Gladdines
 * http://jpopup.seapip.com/LICENSE
 */
jPopup.plugins.ie = {
	overrides: {
		_create: function() {
			var ie = this._vars.version();
			//Add IE version class
			if(ie) {
				this.elements.overlay.addClass("jp_ie"+ie);
				this.elements.wrapper.addClass("jp_ie"+ie);
			}
			//IE6
			if(ie <= 6) {
				//Insane code for an insane browser
				this._vars.fakeScrollbar = $("<div>");
				this._vars.fakeScrollbar.html("<div style=\"position:absolute;top:expression(document.documentElement.scrollTop);right:0;bottom:0;margin-left:-200px;width:0;overflow-y:scroll;height:expression(document.documentElement.clientHeight);z-index:9999999;\"></div>");
				this._vars.fakeScrollbar = this._vars.fakeScrollbar.children();
			}
			return jPopup._super(this);
		},
		open: function() {
			//IE6
			if(this._vars.version() <= 6) {
				var top = ($("html").scrollTop() ? $("html").scrollTop() : $("body").scrollTop());
				this.elements.overlay.css("margin-top", top);
				this.elements.wrapper.css("margin-top", top);
			}
			return jPopup._super(this);
		},
		position: function() {
			var s = jPopup._super(this);
			//IE6
			if(this._vars.version() <= 6) {
				this.elements.overlay.css({"position": "absolute", "width": "2000px", "height": "2000px"});
				this.elements.wrapper.css("position", "absolute");
				this.elements.popup.css("position", "absolute");
			}
			return s;
		},
		_overlay: {
			show: function() {
				//IE8 and below
				if(this._vars.version() <= 8) {
					//Animating overlay is too laggy
					this.elements.overlay.show();
				} else {
					jPopup._super(this);
				}
			},
			hide: function() {
				//IE8 and below
				if(this._vars.version() <= 8) {
					//Animating overlay is too laggy
					this.elements.overlay.hide();
				} else {
					jPopup._super(this);
				}
			}
		},
		_freeze: function() {
			//IE6
			if(this._vars.version() <= 6) {
				if(!("scrollBarWidth" in this._vars)) {
					this._vars.scrollBarWidth = $("html").width() - $(window).width();
				}
				$("html").css({"overflow": "hidden", "padding-right": this._vars.scrollBarWidth});
				$("body").append(this._vars.fakeScrollbar);
			} else {
				jPopup._super(this);
			}
		},
		_unfreeze: function() {
			//IE6
			if(this._vars.version() <= 6) {
				$("html").css({"overflow": "", "padding-right": ""});
				this._vars.fakeScrollbar.remove();
			} else {
				jPopup._super(this);
			}
		},
		_animations: {
			zoomIn: function() {
				//IE9 and below
				if(this._vars.version() <= 9) {
					var x = 0;
					var self = this;
					var speed = this._config.speed;
					var width = this.elements.popup.outerWidth();
					var height = this.elements.popup.outerHeight();
					var filter = this.elements.popup.css("filter");
					filter = filter ? filter+" " : "";
					var msFilter = this.elements.popup.css("filter");
					msFilter = msFilter ? msFilter+" " : "";
					var animate = function() {
						x += 6000 / speed;
						var scale = .8 + .2 * (x / 100);
						var scaleX = width * .1 * (1- (x / 100)) + "px";
						var scaleY = height * .1 * (1- (x / 100)) + "px";
						self.elements.popup.css({
							"-ms-filter": msFilter+"progid:DXImageTransform.Microsoft.Matrix(M11="+scale+", M12=0, M21=0, M22="+scale+", SizingMethod='auto expand')",
							"filter": filter+"progid:DXImageTransform.Microsoft.Matrix(M11="+scale+", M12=0, M21=0, M22="+scale+", SizingMethod='auto expand')",
							"margin-left": scaleX,
							"margin-top": scaleY,
							"opacity": (x / 100)
						});
						if(x >= 100) {
							clearInterval(animation);
							setTimeout(function() {
								self.elements.popup.css({"opacity": "", "-ms-filter": msFilter, "filter": filter, "margin-left": "", "margin-top": ""});
							}, speed);
						}
					}
					var animation = setInterval(animate, 60);
					animate();
				} else {
					jPopup._super(this);
				}
			},
			zoomOut: function() {
				//IE9 and below
				if(this._vars.version() <= 9) {
					var x = 0;
					var self = this;
					var speed = this._config.speed;
					var width = this.elements.popup.outerWidth();
					var height = this.elements.popup.outerHeight();
					var filter = this.elements.popup.css("filter");
					filter = filter ? filter+" " : "";
					var msFilter = this.elements.popup.css("filter");
					msFilter = msFilter ? filter+" " : "";
					var animate = function() {
						x += 6000 / speed;
						var scale = .8 + .2 * (1- (x / 100));
						var scaleX = width * .1 * (x / 100) + "px";
						var scaleY = height * .1 * (x / 100) + "px";
						self.elements.popup.css({
							"-ms-filter": msFilter+"progid:DXImageTransform.Microsoft.Matrix(M11="+scale+", M12=0, M21=0, M22="+scale+", SizingMethod='auto expand')",
							"filter": filter+"progid:DXImageTransform.Microsoft.Matrix(M11="+scale+", M12=0, M21=0, M22="+scale+", SizingMethod='auto expand')",
							"margin-left": scaleX,
							"margin-top": scaleY,
							"opacity": (1- (x / 100))
						});
						if(x >= 100) {
							clearInterval(animation);
							setTimeout(function() {
								self.elements.popup.css({"opacity": "", "-ms-filter": msFilter, "filter": filter, "margin-left": "", "margin-top": ""});
							}, speed);
						}
					}
					var animation = setInterval(animate, 60);
					animate();
				} else {
					jPopup._super(this);
				}
			}
		}
	},
	vars: {
		version: function() {
			//Return IE version
			var ua = window.navigator.userAgent;
			
			//IE10 and below
			var msie = ua.indexOf("MSIE ");
			if (msie > 0) {
				return parseInt(ua.substring(msie + 5, ua.indexOf(".", msie)), 10);
			}
			
			//IE11
			var trident = ua.indexOf("Trident/");
			if (trident > 0) {
				var rv = ua.indexOf("rv:");
				return parseInt(ua.substring(rv + 3, ua.indexOf(".", rv)), 10);
			}
			
			//IE12 (Edge) and above
			var edge = ua.indexOf("Edge/");
			if (edge > 0) {
				return parseInt(ua.substring(edge + 5, ua.indexOf(".", edge)), 10);
			}
		}
	}
};