$(window).on "load", ->
	pf.setPplWidth()

	# Ppl Wrap width
	pplWrapW = pf.ppls_slider.width()
	pf.halfPplWrapW = pplWrapW/2

	if adapt.checkAdapt()
		pf.pmX = 0
	else
		pf.pmX = -(pf.halfPplWrapW)

	TweenMax.set(pf.ppls_wrap, {x:pf.pmX})

	$(window).on "resize", ->
		if pf.aboutReady
			pf.setPplWidth()
			# half Ppl Wrap width
			pplWrapW = pf.ppls_slider.width()
			pf.halfPplWrapW = pplWrapW/2
			ppl = pf.ppls_slider.find('.ppl')
			curPpl = ppl.eq(pf.indexCurImg)
			curPplO = curPpl.position().left
			needPplX = -(((pf.wW/2) - pf.halfPplWrapW*(pf.pplScale-1) + curPplO))
			TweenMax.set(pf.ppls_slider, {x: needPplX})
			# names change width
			if pf.canMovePpl
				pf.changePplWidthBack(pf.pmX)
			else
				pf.changePplWidth()

	pf.ppls_main.on "mousemove", (event) ->
		if pf.canMovePpl
			if !adapt.checkAdapt()
				pf.aboutMousemove(event)

	pf.ppls_names.find('.ppl').on 'click', ->
		# find ppl
		ppl = pf.ppls_slider.find('.ppl')
		if !adapt.checkAdapt()
			if pf.canChangePpl
				pf.canChangePpl = false
				if pf.canMovePpl != false
					pf.indexCurImg = $(this).index()
					# names active
					pf.ppls_wrap.find('.ppl').removeClass 'active'
					$(this).addClass 'active'
					curPpl = ppl.eq(pf.indexCurImg)
					curPplDataId = curPpl.data('id')
					pf.getAboutInfo(curPplDataId)
					# curImg and this data
					curPplImg = curPpl.find('.ppl_img')
					curPplImgBig = curPplImg.data('big')
					curPplImgSmall = curPplImg.data('small')
					ppl.find('.ppl_img').removeClass 'active'
					curPpl.addClass 'active'
					curPpl.find('.ppl_img').addClass 'active'
					curPplO = curPpl.position().left
					bigImgLoad = ->
						curPplImg.attr 'src', curPplImgBig
					# show navigate btns
					pf.showAboutNavBtn()
					# show Pop up with info about Employee
					
					# change Flag Stop Move Ppls
					pf.canMovePpl = false
					# zoom In
					needPplX = -(((pf.wW/2) - pf.halfPplWrapW*(pf.pplScale-1) + curPplO*pf.pplScale))
					TweenMax.to(pf.ppls_slider, 1, {scaleX: pf.pplScale, scaleY: pf.pplScale, x: needPplX, onComplete: bigImgLoad})
					# all plls move out
					for element, index in pf.ppls_slider.find('.ppl')
						elemImg = $(element).find('.ppl_img')
						if elemImg.hasClass 'active'
							TweenMax.to(elemImg, 1, {x: "-30%", y: "7%"})
						else
							if index < pf.indexCurImg
								TweenMax.to(elemImg, 2, {x: -(pf.wW/2), y: "7%"})
							if index > pf.indexCurImg
								TweenMax.to(elemImg, 2, {x: pf.wW/2, y: "7%"})
					# actives
					pf.ppls_grad.addClass "active"
					pf.about_footer.addClass "hide"
					pf.title_about.removeClass "active"
					# names change width
					pf.changePplWidth()
				else
					prevPplImg = ppl.eq(pf.indexCurImg).find('.ppl_img')
					pf.indexCurImg = $(this).index()
					curPplImg = ppl.eq(pf.indexCurImg).find('.ppl_img')
					curPplDataId = ppl.eq(pf.indexCurImg).data('id')
					pf.changePrevCurBigSmall(curPplImg, prevPplImg)
					pf.getAboutInfo(curPplDataId)
					TweenMax.to(prevPplImg, 1, {x: "-130%", onComplete: pf.changeCurPpl})
		else
			adapt.burger.addClass 'active'
			pf.indexCurImg = $(this).index()
			curIdPpl = ppl.eq(pf.indexCurImg).data "id"
			console.log(curIdPpl, pf.indexCurImg)
			pf.getAboutInfo(curIdPpl)

	# Back to About
	pf.back_about_btn.on 'click', (event)->
		event.preventDefault()
		if pf.canChangePpl
			pf.backToAllAbout(true)
			pf.title_about.addClass "active"

	# next_about_btn
	pf.next_about_btn.on 'click', (event)->
		event.preventDefault()
		if pf.indexCurImg+1 < pf.pplLength
			if pf.canChangePpl
				pf.canChangePpl = false
				# increase index
				pf.indexCurImg += 1
				ppl = pf.ppls_slider.find('.ppl')
				curPplImg = ppl.eq(pf.indexCurImg).find('.ppl_img')
				prevPplImg = ppl.eq(pf.indexCurImg-1).find('.ppl_img')
				pf.changePrevCurBigSmall(curPplImg, prevPplImg)
				curPplDataId = ppl.eq(pf.indexCurImg).data('id')
				pf.getAboutInfo(curPplDataId)
				TweenMax.set(curPplImg, {x: "-300%"})
				TweenMax.to(prevPplImg, 1, {x: "-130%", onComplete: pf.changeCurPpl})

	# prev_about_btn
	pf.prev_about_btn.on 'click', (event)->
		event.preventDefault()
		if pf.indexCurImg-1 >= 0
			if pf.canChangePpl
				pf.canChangePpl = false
				# decrease index
				pf.indexCurImg -= 1
				ppl = pf.ppls_slider.find('.ppl')
				curPplImg = ppl.eq(pf.indexCurImg).find('.ppl_img')
				prevPplImg = ppl.eq(pf.indexCurImg+1).find('.ppl_img')
				pf.changePrevCurBigSmall(curPplImg, prevPplImg)
				curPplDataId = ppl.eq(pf.indexCurImg).data('id')
				pf.getAboutInfo(curPplDataId)
				TweenMax.set(curPplImg, {x: "-300%"})
				TweenMax.to(prevPplImg, 1, {x: "-130%", onComplete: pf.changeCurPpl})