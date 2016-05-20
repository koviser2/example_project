$(window).on "load", ->
	# $(window).scrollTop(100);
	$(window).on "resize", ->
		pf.wW = $(window).width()
		pf.wH = $(window).height()

		if !adapt.checkAdapt()
			pf.clearAbout()
			pf.startAbout()
			setTimeout ( ->
				pf.title_about.addClass "active"
			), 2000
			pf.about_footer.delay(2000).fadeIn(1000)

	# touchPageX
	touchPageX = 0
	# about pf.ppls_wrap touchPosX
	pWrapX = 0
	# about pf.ppls_slider Width/2 * 0.96

	pf.ppls_main.on "touchstart", (event) ->
		if adapt.checkAdapt()
			# pf.ppls_names.find('.ppl').off 'click'
			touch = event.originalEvent.touches[0]
			touchPageX = touch.pageX


	pf.ppls_main.on "touchmove", (event) ->
		if adapt.checkAdapt()
			touch = event.originalEvent.touches[0]
			sliderWH8 = (pf.ppls_slider.width()/2)*0.88
			if touch.pageX > touchPageX
				# grab to right
				pWrapX-=4;
				if pWrapX >= 0
					pf.pmX = pWrapX
				else
					pWrapX = 0
					pf.pmX = 0
			else
				# grab to left
				pWrapX+=4;
				if pWrapX <= sliderWH8
					pf.pmX = pWrapX
				else
					pWrapX = sliderWH8
					pf.pmX = sliderWH8

			touchPageX = touch.pageX
			TweenMax.to(pf.ppls_wrap, 0.4, {x: -pf.pmX+20})