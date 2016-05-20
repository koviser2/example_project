$(window).on "load", ->
	adapt.burger.on 'click', ->
		if adapt.burger.hasClass 'active'
			adapt.burger.removeClass 'active'
			adapt.mob_nav.fadeOut 200
			adapt.categ.fadeOut 200
			adapt.about_info.fadeOut 200
			adapt.location_info.fadeOut 200
			adapt.casting_info.fadeOut 200
			adapt.clients_info.fadeOut 200
			adapt.mob_wb_work.fadeOut 200
			adapt.ppl_pop_up_mob.fadeOut 200
		else
			adapt.burger.addClass 'active'
			adapt.mob_nav.fadeIn 200

	# click to mob_nav_item
	adapt.mob_nav.find('.item').on 'click', (event)->
		event.preventDefault()
		adapt.burger.removeClass 'active'
		adapt.mob_nav.fadeOut 200

	# open work categs
	adapt.categ_btn.on 'click', ->
		adapt.burger.addClass 'active'
		adapt.categ.fadeIn 200

	# chose work categ
	adapt.categ.find('.wb_menu_block a').on 'click', (event)->
		event.preventDefault()
		adapt.burger.removeClass 'active'
		adapt.categ.fadeOut 200

	# about info show
	adapt.about_info_btn.on 'click', ->
		adapt.burger.addClass 'active'
		adapt.about_info.fadeIn 200

	# work info show
	pf.work_block.on 'click', '.wb_col', ->
		if adapt.checkAdapt()
			thisDataId = $(this).data "id"
			adapt.burger.addClass 'active'
			load.get_skin({
				id: thisDataId
			})
			adapt.mob_wb_work.fadeIn 200

	# location info show
	adapt.location_info_btn.on 'click', ->
		adapt.burger.addClass 'active'
		adapt.location_info.fadeIn 200

	# casting info show
	adapt.casting_info_btn.on 'click', ->
		adapt.burger.addClass 'active'
		adapt.casting_info.fadeIn 200

	# clients info show
	adapt.clients_info_btn.on 'click', ->
		adapt.burger.addClass 'active'
		adapt.clients_info.fadeIn 200
