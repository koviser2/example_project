# Pronto Film

'use strict'
class Pf
	constructor: ()->
		@wW = $(window).width()
		@wH = $(window).height()
		@header = $('header')
		@logo = $('.logo')
		@pageFlag = false # false
		@nav_item = $('nav.mb_des .item')
		@nav_item_mob = $('nav.mb_ad .item')
		@curPage = @nav_item.index(@nav_item.parent().find(".active")) + 1 # 0
		@pages = $('.pages')
		@page = $('.page')
		@scroll_down = $('.scroll_down')
		### page home ###
		@inside_block = $('.inside_block')
		@cloud = $('.cloud')
		### page work ###
		@part_height_box = 14.81667
		@countSec = 0
		@delaySec = 0
		# "ease" work show massive
		@easeMass = [
			Expo.easeOut
			Expo.easeIn
		]
		# pic Animation "class" massive
		@picAnimMas = [
			"anim_scale"
			"anim_unscale"
			"anim_right"
			"anim_left"
			"anim_top"
			"anim_bottom"
		]
		@work_block = $(".work_block")
		@wb_pop_up = $(".wb_pop_up")
		@wb_pop_up_close = $(".wb_pop_up_close")
		@wb_content = $('.wb_content')
		@main_work_block = $(".main_work_block")
		@wb_cats = $(".wb_cats")
		@wb_cat = $(".wb_cat")
		@wb_menu_block = $(".wb_menu_block")
		@wb_menu_item = $(".wb_menu_item")
		@work_cat_eq = 0
		# navigations
		@work_nav_btn = $(".work_nav_btn")
		@back_work_btn = $(".back_work_btn")
		@next_work_btn = $(".next_work_btn")
		@prev_work_btn = $(".prev_work_btn")
		@work_page = parseInt($('meta[property="work_page"]').attr('content')) || 1
		@locale_page = parseInt($('meta[property="location_page"]').attr('content')) || 1

		@unhover_block = $(".unhover_block")
		### page locations ###
		@loc_svg = $('.loc_svg')
		@canMoveStone = false
		@loc_text = $('.loc_text')
		@loc_text2 = $('.loc_text2')
		@loc_text3 = $('.loc_text3')
		@loc_text4 = $('.loc_text4')
		@loc_text5 = $('.loc_text5')
		@loc_stone1 = $('.loc_stone1')
		@loc_stone2 = $('.loc_stone2')
		@loc_stone3 = $('.loc_stone3')
		@loc_cats = $('.loc_cats')
		@loc_cat = $('.loc_cat')
		@loc_nav = $('.loc_nav')
		@loc_footer = $('.loc_footer')
		@loc_nav_item = $('.loc_nav_item')
		# navigations
		@next_loc_btn = $('.next_loc_btn')
		@prev_loc_btn = $('.prev_loc_btn')
		@loc_nav_btn = $('.loc_nav_btn')
		@back_loc_btn = $('.back_loc_btn')
		### page about ###
		@pplScale = 2.6
		@pmX = 0
		@indexCurImg = 0
		@aboutReady = false
		@canMovePpl = false
		@canChangePpl = false
		@ppl = $('.ppl')
		@ppls_wrap = $('.ppls_wrap')
		@ppls_slider = $('.ppls_slider')
		@ppls_names = $('.ppls_names')
		@pplImg = $(".ppl_img")
		@ppls_grad = $(".ppls_grad")
		@about_footer = $(".about_footer")
		@title_about = $(".title_about")
		@ppls_main = $(".ppls_main")
		@ppl_pop_up = $(".ppl_pop_up")
		# navigations
		@next_about_btn = $('.next_about_btn')
		@prev_about_btn = $('.prev_about_btn')
		@about_nav_btn = $('.about_nav_btn')
		@back_about_btn = $('.back_about_btn')
		@pplLength = @ppls_slider.find('.ppl').length
		@halfPplWrapW = 0

	# city anim To
	cityAnimTo: ->
		TweenMax.to(".city_top", 5, {x: "0%", y: "0%", ease: Circ.easeOut});
		TweenMax.to(".city_bottom", 5, {x: "0%", y: "0%", ease: Circ.easeOut});

	# city anim Out
	cityAnimOut: (numpage) ->
		pf.inside_block.removeClass "active"
		pf.scroll_down.removeClass "active"
		pf.cloud.removeClass "active"
		TweenMax.to(".city_top", 1.6, {x: "-100%", y: "-100%",ease: Power4.easeIn});
		TweenMax.to(".city_bottom", 1.6, {x: "100%", y: "100%", ease: Power4.easeIn, onComplete: @showPage, onCompleteParams:[numpage]});

	place_city: ->
		TweenMax.set(".city_top", {x: "-100%", y: "-100%"});
		TweenMax.set(".city_bottom", {x: "100%", y: "100%"});

	# pageAllInactive
	pageAllInactive: ->
		# page home
		pf.inside_block.removeClass "active"
		pf.scroll_down.removeClass "active"
		pf.cloud.removeClass "active"
		pf.workClearProp()
		pf.wb_menu_block.css "opacity", 0
		pf.hideWorkCat()
		pf.hideWorkNavBtn()
		pf.canMoveStone = false
		pf.locationsStartClear()
		pf.hideLocNavBtn()
		pf.title_about.removeClass "active"
		pf.about_footer.hide()
		pf.aboutReadyStatus(false)
		if !adapt.checkAdapt()
			pf.clearAbout()
		pf.backToAllAbout(false)
		pf.pmX = -(pf.halfPplWrapW)
		clients.active = false
		clients.anim(false)
		casting.clearAll()

	# pageActive
	pageActive: (numpage) ->
		switch numpage
			when 0
				pf.inside_block.addClass "active"
				pf.scroll_down.addClass "active"
				pf.cloud.addClass "active"
			# when 1
			# 	pf.showWorkBlock()
			when 2
				pf.startAbout()
				setTimeout ( ->
					pf.title_about.addClass "active"
				), 2000
				pf.about_footer.delay(2000).fadeIn(1000)
			when 3
				casting.startAnim()
			when 4
				pf.locationsStart()
			when 5
				clients.active = true
				clients.anim(true)

	# change pages
	showPage: (numpage) ->
		# change nav active
		pf.nav_item.removeClass "active"
		pf.nav_item_mob.removeClass "active"
		if numpage != 0
			pf.nav_item.eq(numpage-1).addClass "active"
			pf.nav_item_mob.eq(numpage-1).addClass "active"
		else
			pf.cityAnimTo()
		pf.pages.stop().animate {"opacity": 0}, 400, ->
			# change pages active
			pf.page.removeClass "active"
			pf.page.eq(numpage).addClass "active"
			# show page
			pf.pageAllInactive()
			pf.pages.stop().animate {"opacity": 1}, 400, ->
				pf.pageActive(numpage)
				setTimeout (-> pf.pageFlag = true), 2000

	# #####
	# page work
	# #####

	# loadGetSkins
	loadGetSkins: ->
		load.get_skins({
			id: pf.wb_menu_block.find(".active a").data("id")
			callback: ->
				pf.showWorkCat()
				# setRandomAnimation to Work Pic
				pf.animWorkPicTo pf.wb_cat
		})


	getRandom: (min, max) ->
		(Math.random() * (max - min) + min).toFixed(1)

	# hideUnhoverBlock
	hideUnhoverBlock: ->
		pf.unhover_block.animate {"opacity": 0}, 3000, ->
			$(this).hide()

	showWorkBlock: ->
		pf.work_block.find('.wb_blk_box').each ->
			# random sek show work block
			pf.countSec = pf.getRandom(0.3, 1.4)
			# delay
			pf.delaySec = pf.getRandom(0.6, 2.4)
			# show Unhover Block
			pf.unhover_block.stop().show()
			# hideUnhoverBlock
			pf.hideUnhoverBlock()
			# easeRand
			easeRand = Math.round(pf.getRandom(0, pf.easeMass.length-1))

			if $(this).hasClass("wb_full_h") && $(this).hasClass("slide")
				TweenMax.to($(this), pf.countSec, {delay: pf.delaySec, width: '0', ease: pf.easeMass[easeRand]});
			else if $(this).hasClass("wb_full_h")
				TweenMax.to($(this), pf.countSec, {delay: pf.delaySec, height: '0', ease: pf.easeMass[easeRand]});
			else if $(this).hasClass("wb_half_h")
				TweenMax.to($(this), pf.countSec, {delay: pf.delaySec, height: (pf.part_height_box*2) + 'rem', ease: pf.easeMass[easeRand]});
			else
				TweenMax.to($(this), pf.countSec, {delay: pf.delaySec, height: pf.part_height_box + 'rem', ease: pf.easeMass[easeRand]});

	# set random animation ("anim_scale", "anim_unscale", "anim_right"... array = picAnimMas)

	animWorkPicTo: (to)->
		to.find(".wb_col").each ->
			self = $(this)
			pf.animWorkPic(self)

	animWorkPic: (self)->
		picAnimRand = pf.getRandom(0, 5)
		picAnimRand = Math.round(pf.getRandom(0, pf.picAnimMas.length-1))
		self.find('.pic').addClass(pf.picAnimMas[picAnimRand]);

	# workClearProp
	workClearProp: ->
		TweenMax.set( pf.work_block.find('.wb_blk_box'), {clearProps:"all"});

	# addWorkMenuActive
	addWorkMenuActive: ->
		pf.wb_menu_block.animate {"opacity": 0}, 400, ->
			pf.wb_menu_block.addClass 'active'
			pf.wb_menu_block.animate {"opacity": 1}, 400

	# addWorkMenuActive
	removeWorkMenuActive: ->
		pf.wb_menu_block.animate {"opacity": 0}, 400, ->
			pf.wb_menu_block.removeClass 'active'
			pf.wb_menu_block.animate {"opacity": 1}, 400

	# showWorkCat
	showWorkCat: ->
		if pf.wb_cat.hasClass 'active'
			pf.wb_cats.animate {"opacity": 0}, 400, ->
				pf.wb_cat.removeClass 'active'
				# clear and after show work block
				pf.workClearProp()
				
				pf.wb_cat.eq(pf.work_cat_eq).addClass 'active'
				pf.wb_cats.animate {"opacity": 1}, 400, ->
					pf.showWorkBlock()
		else
			pf.wb_cats.addClass 'active'
			pf.wb_cat.eq(pf.work_cat_eq).addClass 'active'
			# clear and after show work block
			pf.workClearProp()
			pf.wb_cats.animate {"opacity": 1}, 400, ->
				pf.showWorkBlock()
				# showBackToWorkBtn
				pf.showWorkNavBtn()

	click_web_element: (element, time = 400)->
		# change work_menu_item active
		pf.wb_menu_item.removeClass 'active'
		$(element).parent().addClass 'active'
		id = $(element).data "id"
		# change work_menu and work catergoy active
		if pf.main_work_block.hasClass 'active'
			pf.main_work_block.stop().animate {"opacity": 0}, time, ->
				pf.main_work_block.removeClass 'active'
				pf.addWorkMenuActive()
				pf.loadGetSkins()
		else
			pf.loadGetSkins()

	click_loc_element: (element)->
		pf.canMoveStone = false
		# thisIndex = $(this).parent().index()
		id = $(element).data "id"
		pf.loc_nav_item.find('a').removeClass 'active'
		$(element).addClass 'active'
		pf.loc_cats.show()
		if pf.loc_cats.hasClass 'active'
			pf.changeLocCat(id)
		else
			pf.firstClickLocCat(id)
	# hideWorkCat
	hideWorkCat: ->
		pf.wb_cats.animate {"opacity": 0}, 400, ->
			pf.removeWorkMenuActive()
			pf.wb_cats.removeClass 'active'
			pf.wb_cat.removeClass 'active'
			pf.wb_menu_item.removeClass 'active'
			# clear and after show work block
			pf.workClearProp()
			pf.main_work_block.addClass 'active'
			pf.showWorkBlock()
			pf.main_work_block.animate {"opacity": 1}, 400

	# showWorkNavBtn
	showWorkNavBtn: ->
		pf.work_nav_btn.addClass 'active'
		pf.work_nav_btn.animate {"opacity": 1}, 400

	# hideWorkNavBtn
	hideWorkNavBtn: ->
		pf.work_nav_btn.animate {"opacity": 0}, 400, ->
			pf.work_nav_btn.removeClass 'active'

	# workPopUpOpen
	workPopUpOpen: ->
		# hide work categories
		# lock mouseWheel
		pf.pageFlag = false
		pf.wb_content.animate {"opacity": 0}, 500, ->
			pf.header.removeClass "active"
			pf.wb_pop_up_close.addClass "active"
			# show pop up work
			pf.wb_pop_up.addClass "active"
			pf.wb_pop_up.animate {"opacity": 1}, 500, ->
				# show close btn

	# workPopUpClose
	workPopUpClose: ->
		pf.wb_pop_up_close.removeClass "active"
		pf.header.addClass "active"
		# hide pop up work
		pf.wb_pop_up.animate {"opacity": 0}, 500, ->
			pf.wb_pop_up.removeClass "active"
			# show work categories
			$('.wb_content').animate {"opacity": 1}, 500
			# unlock mouseWheel
			pf.pageFlag = true

	# #####
	# page locations
	# #####
	# locationsStones
	trueMoveStone: ->
		pf.canMoveStone = true

	# locationMainActive
	locationMainActive: ->
		# pf.loc_nav.fadeIn(800)
		pf.loc_nav.addClass "active"
		pf.loc_footer.fadeIn(800)

	# locationMainInActive
	locationMainInActive: ->
		# pf.loc_nav.css "display", "none"
		pf.loc_nav.removeClass "active loc_nav_left"
		pf.loc_nav.find('.loc_nav_item a').removeClass "active"
		pf.loc_footer.css "display", "none"
		pf.loc_cats.removeClass 'active'
		pf.loc_cat.removeClass 'active'
		pf.loc_cats.hide()
		pf.loc_svg.show()

	# locaionsStart
	locationsStart: ->
		TweenMax.to(pf.loc_text, 0.8, {attr:{transform: "matrix(1, 0, 0, 1, 0, 0)"}, ease: Power3.easeIn, delay: 1})
		TweenMax.to(pf.loc_text2, 0.8, {attr:{transform: "matrix(1, 0, 0, 1, 0, 0)", opacity: 1}, ease: Power3.easeIn, delay: 1})
		TweenMax.to(pf.loc_text3, 0.3, {attr:{opacity: "1"}, delay: 1.79, onComplete: pf.locationMainActive})
		TweenMax.to(pf.loc_text4, 0.5, {attr:{transform: "matrix(1, 0, 0, 1, 0, 0)", opacity: "1"}, delay: 1.79})
		tl = new TimelineMax()
		tl.to(pf.loc_text5, 0.3, {attr:{opacity: "1"}, delay: 1.79})
		tl.to(pf.loc_text5, 1,{attr:{transform: "matrix(1, 0, 0, 1, 0, -30)", opacity: "0"}, onComplete: pf.trueMoveStone})

	locationsElement: ->
		TweenMax.to(pf.loc_text, 0.8, {attr:{transform: "matrix(1, 0, 0, 1, 0, 0)"}, delay: 1})
		TweenMax.to(pf.loc_text2, 0.8, {attr:{transform: "matrix(1, 0, 0, 1, 0, 0)", opacity: 1}, delay: 1})
		TweenMax.to(pf.loc_text3, 0.3, {attr:{opacity: "1"}, delay: 1.79})
		TweenMax.to(pf.loc_text4, 0.5, {attr:{transform: "matrix(1, 0, 0, 1, 0, 0)", opacity: "1"}, delay: 1.79})
		tl = new TimelineMax()
		tl.to(pf.loc_text5, 0.3, {attr:{opacity: "1"}, delay: 1.79})
		tl.to(pf.loc_text5, 1,{attr:{transform: "matrix(1, 0, 0, 1, 0, -30)", opacity: "0"}, onComplete: pf.trueMoveStone})
		
	# locaionsStartClear
	locationsStartClear: ->
		TweenMax.set(pf.loc_text, {attr:{transform: "matrix(1, 0, 0, 1, 0, -1200)"}})
		TweenMax.set(pf.loc_text2, {attr:{transform: "matrix(1, 0, 0, 1, 0, -100)", opacity: 0}})
		TweenMax.set(pf.loc_text3, {attr:{opacity: "0"}})
		TweenMax.set(pf.loc_text4, {attr:{transform: "matrix(0.2, 0, 0, 0.2, 1100, 900)", opacity: "0"}})
		TweenMax.set(pf.loc_text5, {attr:{opacity: "0",transform: "matrix(1, 0, 0, 1, 0, 0)"}})
		pf.locationMainInActive()

	# showLocCat
	showLocCat: (val)->
		pf.loc_cats.stop().fadeOut 400, ->
			pf.loc_cat.removeClass 'active'
			pf.loc_cat.eq(val).addClass 'active'
			pf.loc_cats.fadeIn()

	changeLocCat: (id)->
		pf.loc_cats.stop().fadeOut 400, ->
			pf.workClearProp()
			pf.loc_cat.removeClass 'active'
			pf.loc_cat.addClass 'active'
			pf.loc_cats.stop().fadeIn 400, ->
				load.get_locales id, ->
					pf.showWorkBlock()

	firstClickLocCat: (id)->
		pf.loc_svg.stop().fadeOut 400, ->
			pf.workClearProp()
			# fadeOut bottom text
			pf.loc_footer.fadeOut(400)
			# fadeOut loc nav
			# pf.loc_nav.stop().fadeOut 400, ->
			# fadeIn and move to left loc nav
			pf.loc_nav.addClass 'loc_nav_left'
			# pf.loc_nav.fadeIn(400)
			# fadeIn loc cats and cat
			pf.loc_cats.addClass 'active'
			pf.loc_cat.removeClass 'active'
			pf.loc_cat.addClass 'active'
			pf.loc_cats.stop().fadeIn 400, ->
				load.get_locales id, ->
					pf.showWorkBlock()
					pf.showLocNavBtn()

	# showLocNavBtn
	showLocNavBtn: ->
		pf.loc_nav_btn.addClass 'active'
		pf.loc_nav_btn.stop().animate {"opacity": 1}, 400

	# hideLocNavBtn
	hideLocNavBtn: ->
		pf.loc_nav_btn.animate {"opacity": 0}, 400, ->
			pf.loc_nav_btn.removeClass 'active'

	# #####
	# page about
	# #####
	# set ppl wrap about

	# aboutReady
	aboutReadyStatus: (val, timeSec = 10) ->
		setTimeout ( ->
			pf.aboutReady = val
			pf.canMovePpl = val
			pf.canChangePpl = val
		), timeSec

	aboutMousemove: (event) ->
		pX = event.pageX
		pf.pmX = -((( (pX-pf.wW/2) * (pf.halfPplWrapW*0.9) )/pf.wW) + pf.halfPplWrapW)
		TweenMax.to(pf.ppls_wrap, 0.7, {x:pf.pmX})

	# startAbout
	startAbout: ->
		pplI = pf.ppls_slider.find('.ppl')
		pplN = pf.ppls_names.find('.ppl')
		pplFrontIndex = pf.ppls_wrap.find('.ppl.front').index()
		pf.indexCurImg = pplFrontIndex
		ind = 0
		indexUp = ->
			ind++
			if ind <= pplI.length/2
				moveNext(ind)
			else
				pf.aboutReadyStatus(true, 3000)
		moveNext = (ind)->
			timeSec = ind/2
			TweenMax.to(pplI.eq(pf.indexCurImg-ind).find('.ppl_img'), 2 + timeSec, {x: "-50%",clearProps:"matrix"})
			TweenMax.to(pplI.eq(pf.indexCurImg+ind).find('.ppl_img'), 2 + timeSec, {x: "-50%",clearProps:"matrix"})
			TweenMax.to(pplN.eq(pf.indexCurImg-ind).find('.ppl_name'), 2 + timeSec, {x: "-50%",clearProps:"matrix"})
			TweenMax.to(pplN.eq(pf.indexCurImg+ind).find('.ppl_name'), 2 + timeSec, {x: "-50%",clearProps:"matrix"})
			indexUp()

		if adapt.checkAdapt()
			pf.aboutReadyStatus(true, 300)
		else
			TweenMax.to(pplI.eq(pf.indexCurImg).find('.ppl_img'), 2, {x: "-50%",clearProps:"matrix"})
			TweenMax.to(pplN.eq(pf.indexCurImg).find('.ppl_name'), 2, {x: "-50%",clearProps:"matrix"})
			moveNext(ind)

	# startAbout
	clearAbout: ->
		ppl = pf.ppls_slider.find('.ppl')
		pplName = pf.ppls_names.find('.ppl')
		pplFrontIndex = pf.ppls_slider.find('.ppl.front').index()
		pf.indexCurImg = pplFrontIndex
		pplFront = ppl.eq(pf.indexCurImg).find('.ppl_img')
		for element, index in ppl
			elemImg = $(element).find('.ppl_img')
			if $(element).hasClass 'front'
				TweenMax.set(elemImg, {x: -(pf.wW*0.7)})
			else
				if index < pf.indexCurImg
					TweenMax.set(elemImg, {x: -(pf.wW)})
				if index > pf.indexCurImg
					TweenMax.set(elemImg, {x: (pf.wW)})
		for element, index in pplName
			elemName = $(element).find('.ppl_name')
			if $(element).hasClass 'front'
				TweenMax.set(elemName, {x: -(pf.wW*0.7)})
			else
				if index < pf.indexCurImg
					TweenMax.set(elemName, {x: -(pf.wW)})
				if index > pf.indexCurImg
					TweenMax.set(elemName, {x: (pf.wW)})

	# backToAllAbout
	backToAllAbout: (val)->
		ppl = pf.ppls_slider.find('.ppl')
		curPpl = ppl.eq(pf.indexCurImg)
		curPpl.removeClass 'active'
		curPplImg = curPpl.find('.ppl_img')
		# remove active from ppl and names
		curPplImg.removeClass 'active'
		pf.ppls_names.find('.ppl').removeClass 'active'
		# change data to small
		curPplImgSmall = curPplImg.data('small')
		curPplImg.attr 'src', curPplImgSmall
		# hide navigate btns
		pf.hideAboutNavBtn()
		pf.ppl_pop_up.fadeOut(400)
		# back actives
		pf.changePplWidthBack(pf.pmX)
		pf.ppls_grad.removeClass "active"
		pf.about_footer.removeClass "hide"
		# zoom Out
		TweenMax.to(pf.pplImg, 1, {x: "-50%", y: "0%"})
		TweenMax.to(pf.ppls_slider, 1, {scaleX: 1, scaleY: 1, x: pf.pmX, onComplete: pf.canMovePplSet, onCompleteParams: [val]})

	setPplWidth: ->
		# ppl width
		pplW = pf.wW/8
		# set ppl width
		pf.ppl.width(pplW)
		# set ppls_wrap width
		pf.ppls_wrap.width(pplW*pf.pplLength)

	# changePplWidth
	changePplWidth: ->
		pplMainW = pf.ppls_main.width()
		pplL = parseInt(pplMainW/(pf.pplLength))
		# all names show in window width
		TweenMax.to(pf.ppls_names.find('.ppl'), 0.96, {width:pplL})
		TweenMax.to(pf.ppls_names, 1, {width:pplMainW, x: -(pplMainW/2), y: '8%'})

	# changePplWidthBack
	changePplWidthBack: (pmX)->
		pplSliderW = pf.ppls_slider.width()
		pplSliderPplsW = parseInt(pplSliderW/pf.pplLength)
		TweenMax.to(pf.ppls_names.find('.ppl'), 1, {width:pplSliderPplsW})
		TweenMax.to(pf.ppls_names, 0.96, {width:pplSliderW, x:pmX, y: "0%"})

	# showAboutNavBtn
	showAboutNavBtn: ->
		pf.about_nav_btn.addClass 'active'
		pf.about_nav_btn.stop().animate {"opacity": 1}, 400

	# hideAboutNavBtn
	hideAboutNavBtn: ->
		pf.about_nav_btn.animate {"opacity": 0}, 400, ->
			pf.about_nav_btn.removeClass 'active'

	# canMovePplSet Flag value
	canMovePplSet: (val)->
		pf.canMovePpl = val

	# changeCurPpl
	changeCurPpl: ->
		ppl = pf.ppls_slider.find('.ppl')
		curPpl = ppl.eq(pf.indexCurImg)
		curPplImg = curPpl.find('.ppl_img')
		pplImg = ppl.find('.ppl_img')
		curPplO = curPpl.position().left
		# actives ppl and names
		pplImg.removeClass 'active'
		pf.ppls_wrap.find('.ppl').removeClass 'active'
		curPpl.addClass 'active'
		curPplImg.addClass 'active'
		pf.ppls_names.find('.ppl').eq(pf.indexCurImg).addClass 'active'
		# Slide To
		needPplX = -(((pf.wW/2) - pf.halfPplWrapW*(pf.pplScale-1) + curPplO))
		TweenMax.set(curPplImg, {x: "-300%"})
		TweenMax.set(pf.ppls_slider, {x: needPplX})
		# move ppl Out
		for element, index in pf.ppls_slider.find('.ppl')
			elemImg = $(element).find('.ppl_img')
			if elemImg.hasClass 'active'
				TweenMax.to(elemImg, 1, {x: "-30%", onComplete: pf.setCanChangePpl, onCompleteParams: [true]})
			else
				if index < pf.indexCurImg
					TweenMax.set(elemImg, {x: -(pf.wW/2)})
				if index > pf.indexCurImg
					TweenMax.set(elemImg, {x: (pf.wW/2)})

	# canChangePpl set value
	setCanChangePpl: (val)->
		pf.canChangePpl = val

	# changePrevCurBigSmall
	changePrevCurBigSmall: (cur, prev) ->
		curBig = cur.data('big')
		prevSmall = prev.data('small')
		cur.attr('src', curBig)
		prev.attr('src', prevSmall)

	# getAboutInfo
	getAboutInfo: (curPplDataId) ->
		if !adapt.checkAdapt()
			pf.ppl_pop_up.fadeOut 500, ->
				load.get_about_info({
					id: curPplDataId
					callback: ->
						pf.ppl_pop_up.fadeIn(600, -> pf.canChangePpl = true )
					})
		else
			adapt.ppl_pop_up_mob.fadeOut 500, ->
				load.get_about_info({
					id: curPplDataId
					callback: ->
						adapt.ppl_pop_up_mob.fadeIn(600, -> pf.canChangePpl = true )
					})

# create class pf
pf = new Pf()
window.pf = pf