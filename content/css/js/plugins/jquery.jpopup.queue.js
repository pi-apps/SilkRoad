/**
 * @license
 *
 * jPopup v2.0.0
 * http://jpopup.seapip.com
 
 * Copyright Thomas Gladdines
 * http://jpopup.seapip.com/LICENSE
 */
jPopup.plugins.queue = {
	defaults: false,
	overrides: {
		_create: function() {
			var s = jPopup._super(this);
			if(this._config.plugins.queue) {
				this.__vars.step = 0;
				this.__vars.config = $.extend(true, {}, this._config);
				if(!(this._config.plugins.queue.button instanceof jPopup.button)) {
					this._config.plugins.queue.button = new jPopup.button(this._config.plugins.queue.button);
				}
				this.__vars.nextButton = this._config.plugins.queue.button.clone();
				var onclick = this.__vars.nextButton.onclick();
				this.__vars.nextButton.onclick(function() {
					if(onclick) {
						onclick.call(this);
					}
					this._config.plugins.queue.steps[this.__vars.step].call(this);
					this.__vars.nextButton.remove();
					if(this._config.plugins.queue.steps.length - 1 > this.__vars.step) {
						this.buttons.add(this.__vars.nextButton);
						this.__vars.nextButton.move(0, true);
						this.__vars.step++;
					}
				}).close(false);
				this.buttons.add(this.__vars.nextButton);
				this.__vars.nextButton.move(0, true);
			}
			return s;
		},
		close: function() {
			var s =  jPopup._super(this);
			if(this._config.plugins.queue) {
				var self = this;
				setTimeout(function() {
					self._config = self.__vars.config;
					self._create();
				}, this._config.speed);
			}
			return s;
		}
	}
};