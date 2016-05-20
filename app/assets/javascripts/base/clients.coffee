$(window).on "load", ->
	clients.logos_wrapper.parent().on "mousemove", (event) ->
		x = -event.pageX * (clients.max_w - clients.pw) / clients.pw
		if clients.active
			clients.move(x)

	$(window).on "resize", (event) ->
		clients.center = $(window).width() / 2
		clients.max_w = clients.logos_wrapper.width()