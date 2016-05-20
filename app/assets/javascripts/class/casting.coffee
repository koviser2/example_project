'use strict'
class Сasting
	constructor: ()->
		@svg = $('.casting_svg')
		@svgGrad = $('.svg_grad')
		@man = $('.cast_man')
		@boy = $('.cast_boy')
		@woman = $('.cast_woman')
		@girl = $('.cast_girl')
		@girlHands = $('.cast_girl_fingers')
		@text = $('.cast_text')
		@title = $('.cast_title')
		@titleL = $('.cast_title_l')
		@titleR = $('.cast_title_r')
		@gal = $('.cast_gal')
		@navBtn = $('.casting_nav_btn')
		@backBtn = $('.back_casting_btn')
		@botText = $('.cast_bot_text')
		@btn_next = $(".casting_nav_btn .next_casting_btn")
		@btn_prev = $(".casting_nav_btn .prev_casting_btn")
		@page = parseInt($('meta[property="casting_page"]').attr('content')) || 1
		@type = parseInt($('meta[property="casting_type"]').attr('content')) || 0

	startAnim: ->
		tl = new TimelineMax()
		tl2 = new TimelineMax()
		TweenMax.to(casting.titleL, .5, {attr:{transform:"matrix(1, 0, 0, 1, 803, 587)"}, delay: .6})
		TweenMax.to(casting.titleR, .5, {attr:{transform:"matrix(1, 0, 0, 1, 345, 591)"}, delay: .6})
		TweenMax.to(casting.man, .7, {attr:{transform:"matrix(1, 0, 0, 1, 0, 0)"}, delay: 1.2})
		TweenMax.to(casting.boy, .7, {attr:{transform:"matrix(1, 0, 0, 1, 0, 0)"}, delay: 1.7})
		TweenMax.to(casting.woman, .7, {attr:{transform:"matrix(1, 0, 0, 1, 0, 0)"}, delay: 2.2})
		tl.to(casting.girl, .7, {attr:{transform:"matrix(1, 0, 0, 1, 0, -32)"}, delay: 2.7})
			.set(casting.girlHands, {attr:{opacity: 1}})
			.to(casting.girl, .2, {attr:{transform:"matrix(1, 0, 0, 1, 0, 0)"}})
		tl2.set(casting.text, {attr:{transform:"matrix(1, 0, 0, 1, 0, 0)"}, delay: 3.4})
			.to(casting.text, .3, {attr:{opacity: 1}})
		TweenMax.to(casting.botText, .6, {y: "0%", delay: 3.6})

	people_first: ->
		tl = new TimelineMax()
		tl2 = new TimelineMax()
		TweenMax.to(casting.titleL, 0, {attr:{transform:"matrix(1, 0, 0, 1, 803, 587)"}})
		TweenMax.to(casting.titleR, 0, {attr:{transform:"matrix(1, 0, 0, 1, 345, 591)"}})
		TweenMax.to(casting.man, 0, {attr:{transform:"matrix(1, 0, 0, 1, 0, 0)"}})
		TweenMax.to(casting.boy, 0, {attr:{transform:"matrix(1, 0, 0, 1, 0, 0)"}})
		TweenMax.to(casting.woman, 0, {attr:{transform:"matrix(1, 0, 0, 1, 0, 0)"}})
		tl.to(casting.girl, 0, {attr:{transform:"matrix(1, 0, 0, 1, 0, -32)"}})
			.set(casting.girlHands, {attr:{opacity: 1}})
			.to(casting.girl, 0, {attr:{transform:"matrix(1, 0, 0, 1, 0, 0)"}})
		tl2.set(casting.text, {attr:{transform:"matrix(1, 0, 0, 1, 0, 0)"}})
			.to(casting.text, 0, {attr:{opacity: 1}})
		TweenMax.to(casting.botText, 0, {y: "0%"})

	clearAll: ->
		TweenMax.set(casting.titleL, {attr:{transform:"matrix(1, 0, 0, 1, 2603, 587)"}})
		TweenMax.set(casting.titleR, {attr:{transform:"matrix(1, 0, 0, 1, -1455, 591)"}})
		TweenMax.set(casting.man, {attr:{transform:"matrix(1, 0, 0, 1, 0, 1071)"}})
		TweenMax.set(casting.boy, {attr:{transform:"matrix(1, 0, 0, 1, 0, 945)"}})
		TweenMax.set(casting.woman, {attr:{transform:"matrix(1, 0, 0, 1, 0, 892)"}})
		TweenMax.set(casting.girl, {attr:{transform:"matrix(1, 0, 0, 1, 0, 770)"}})
		TweenMax.set(casting.girlHands, {attr:{opacity: 0}})
		TweenMax.set(casting.text, {attr:{transform:"matrix(1, 0, 0, 1, 0, -800)", opacity: 0}})
		TweenMax.set(casting.botText, {y: "150%"})
		casting.navBtn.css "opacity", 0
		casting.navBtn.removeClass 'active'
		casting.gal.hide()
		casting.svg.show()
		casting.fallClear()

	# showCasNavBtn
	showNavBtn: ->
		casting.navBtn.addClass 'active'
		casting.navBtn.animate {"opacity": 1}, 400

	# hideCasNavBtn
	hideNavBtn: ->
		casting.navBtn.animate {"opacity": 0}, 400, ->
			casting.navBtn.removeClass 'active'

	# showGal
	showGal: ->
		casting.showNavBtn()
		casting.svg.fadeOut 300, ->
			casting.gal.fadeIn 300, ->
				casting.gal.find('.block').addClass 'active'

	load_element: ->
		link.casting_page()
		casting.gal.fadeOut 300, ->
			casting.gal.find('.block').removeClass 'active'
			load.get_casting
				type: casting.type
				callback: ->
					casting.gal.fadeIn 300, ->
						casting.gal.find('.block').addClass 'active'

	# hideGal
	hideGal: ->
		casting.hideNavBtn()
		casting.gal.fadeOut 300, ->
			casting.gal.find('.block').removeClass 'active'
			casting.svg.fadeIn 300

	# fall
	fall: ->
		TweenMax.to(casting.svgGrad, .4, {attr:{transform: "matrix(1, 0, 0, 1, 0, 500)"}})
		TweenMax.to(casting.svg, 1.8, {transform:"rotateX(130deg)", delay: .3, ease: Circ.easeOut, onComplete: casting.showGal})
		TweenMax.to(casting.botText, .4, {y: "150%"})

	# fallClear
	fallClear: ->
		TweenMax.set(casting.svgGrad, {attr:{transform: "matrix(1, 0, 0, 1, 0, 0)"}})
		TweenMax.set(casting.svg, {transform:"rotateX(0deg)"})

# create class casting
casting = new Сasting()
window.casting = casting