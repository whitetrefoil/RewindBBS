var ClickMenu, DelayedHoverMenu;

ClickMenu = (function() {

  function ClickMenu(trigger, menu, isDefaultShow, duration) {
    if (isDefaultShow == null) isDefaultShow = false;
    this.duration = duration != null ? duration : 0;
    this.jTrigger = trigger;
    this.jMenu = menu;
    if (isDefaultShow) {
      this.jTrigger.show(this.duration);
      this.isHidden = false;
    } else {
      this.jTrigger.hide(this.duration);
      this.isHidden = true;
    }
    this.setEvents();
  }

  ClickMenu.prototype.setEvents = function() {
    var _this = this;
    return this.jTrigger.click(function() {
      if (_this.isHidden) {
        _this.jMenu.stop().show(_this.duration);
        return _this.isHidden = false;
      } else {
        _this.jMenu.stop().hide(_this.duration);
        return _this.isHidden = true;
      }
    });
  };

  return ClickMenu;

})();

DelayedHoverMenu = (function() {

  function DelayedHoverMenu(trigger, menu, showDelay, hideDelay) {
    this.jTrigger = trigger;
    this.jMenu = menu;
    this.showDelay = showDelay ? showDelay : 200;
    this.hideDelay = hideDelay ? hideDelay : 200;
    this.handle = false;
    this.inFace = false;
    this.inMenu = false;
    this.setEvents();
  }

  DelayedHoverMenu.prototype.setEvents = function() {
    var _this = this;
    this.jTrigger.mouseenter(function() {
      _this.inFace = true;
      return _this.handle = window.setTimeout(function() {
        _this.clearAll();
        _this.jTrigger.addClass("hover");
        return _this.jMenu.show();
      }, _this.showDelay);
    });
    this.jTrigger.mouseleave(function() {
      _this.inFace = false;
      return _this.handle = window.setTimeout(function() {
        if (!(_this.inFace || _this.inMenu)) {
          _this.clearAll();
          _this.jTrigger.removeClass("hover");
          return _this.jMenu.hide();
        }
      }, _this.hideDelay);
    });
    this.jMenu.mouseenter(function() {
      _this.inMenu = true;
      return _this.clearAll();
    });
    return this.jMenu.mouseleave(function() {
      _this.inMenu = false;
      return _this.handle = window.setTimeout(function() {
        if (!(_this.inFace || _this.inMenu)) {
          _this.clearAll();
          _this.jTrigger.removeClass("hover");
          return _this.jMenu.hide();
        }
      }, _this.hideDelay);
    });
  };

  DelayedHoverMenu.prototype.clearAll = function() {
    if (this.handle) window.clearTimeout(this.handle);
    this.jTrigger.stop();
    return this.jMenu.stop();
  };

  return DelayedHoverMenu;

})();

$(function() {
  var menu;
  return menu = new DelayedHoverMenu($("#avatarBg"), $("#userNavContent"), 200, 400);
});
