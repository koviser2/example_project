$(window).on "load", ->

	$(window).on "mousemove", (event) ->
		if pf.canMoveStone
			pX = event.pageX
			pY = event.pageY
			pmX = (( (pX-(pf.wW/2)) * 100)/pf.wW)*0.8
			pmY = (( (pY-(pf.wH/2)) * 100)/pf.wH)*0.8
			TweenMax.to(pf.loc_stone1, 1.8, {attr:{transform: "matrix(1, 0, 0, 1," + pmX + ", " +pmY+")"}})
			TweenMax.to(pf.loc_stone2, 1.2, {attr:{transform: "matrix(1, 0, 0, 1," + pmX + ", " +pmY+")"}})
			TweenMax.to(pf.loc_stone3, 0.6, {attr:{transform: "matrix(1, 0, 0, 1," + pmX + ", " +pmY+")"}})

	pf.loc_nav_item.find('a').on 'click', (event)->
		event.preventDefault()
		pf.locale_page = 1
		link.set_url $(this).data "url"
		pf.click_loc_element this

	pf.next_loc_btn.click (event)->
		event.preventDefault()
		pf.locale_page += 1
		link.location_page()
		id = pf.loc_nav_item.find("a.active").data "id"
		pf.changeLocCat(id)

	pf.prev_loc_btn.click (event)->
		event.preventDefault()
		pf.locale_page -= 1
		link.location_page()
		id = pf.loc_nav_item.find("a.active").data "id"
		pf.changeLocCat(id)

	pf.back_loc_btn.on 'click', (event)->
		event.preventDefault()
		link.set_url $(this).data "url"
		pf.hideLocNavBtn()
		pf.trueMoveStone()
		# pf.locationsStartClear()
		pf.loc_cats.stop().fadeOut 400, ->
			pf.loc_svg.fadeIn 400
				# pf.locationsStart()
		pf.loc_cats.removeClass 'active'
		pf.loc_cat.removeClass 'active'
		# pf.loc_nav.fadeOut 400, ->
		pf.loc_nav_item.find('a').removeClass 'active'
		pf.loc_nav.removeClass 'loc_nav_left'
		pf.loc_footer.fadeIn(800)