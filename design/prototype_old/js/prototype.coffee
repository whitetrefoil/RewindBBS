class ClickMenu
	constructor: (trigger, menu, isDefaultShow=false, @duration=0) ->
		@jTrigger = trigger
		@jMenu = menu
		if isDefaultShow
			@jTrigger.show(@duration)
			@isHidden = false
		else
			@jTrigger.hide(@duration)
			@isHidden = true
		@setEvents()
	setEvents: ->
		@jTrigger.click =>
			if @isHidden
				@jMenu.stop().show(@duration)
				@isHidden = false
			else
				@jMenu.stop().hide(@duration)
				@isHidden = true


class DelayedHoverMenu
	constructor: (trigger, menu, showDelay, hideDelay) ->
		@jTrigger = trigger
		@jMenu = menu
		@showDelay = if showDelay then showDelay else 200
		@hideDelay = if hideDelay then hideDelay else 200
		@handle = false
		@inFace = false
		@inMenu = false
		@setEvents()
	setEvents: ->
		@jTrigger.mouseenter =>
			@inFace = true
			@handle = window.setTimeout(
				=>
					@clearAll()
					@jTrigger.addClass("hover")
					@jMenu.show()
				, @showDelay
			)
		@jTrigger.mouseleave =>
			@inFace = false
			@handle = window.setTimeout(
				=>
					if !(@inFace || @inMenu)
						@clearAll()
						@jTrigger.removeClass("hover")
						@jMenu.hide()
				, @hideDelay
			)
		@jMenu.mouseenter =>
			@inMenu = true
			@clearAll()
		@jMenu.mouseleave =>
			@inMenu = false
			@handle = window.setTimeout(
				=>
					if !(@inFace || @inMenu)
						@clearAll()
						@jTrigger.removeClass("hover")
						@jMenu.hide()
				, @hideDelay
			)
	clearAll: ->
		window.clearTimeout @handle if @handle
		@jTrigger.stop()
		@jMenu.stop()

$ ->
	menu = new DelayedHoverMenu $("#avatarBg"), $("#userNavContent"), 200, 400
