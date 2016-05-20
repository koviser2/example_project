'use strict'
class Adapt
	constructor: ()->
		@mob_nav = $('.mob_nav')
		@burger = $('.burger')
		@categ = $('.mob_wb_categ')
		@categ_btn = $('.mob_wb_categ_btn')
		@about_info = $('.mob_about_info')
		@location_info = $('.mob_location_info')
		@casting_info = $('.mob_casting_info')
		@clients_info = $('.mob_clients_info')
		@about_info_btn = $('.mob_about_info_btn')
		@location_info_btn = $('.mob_location_info_btn')
		@casting_info_btn = $('.mob_casting_info_btn')
		@clients_info_btn = $('.mob_clients_info_btn')
		@mob_wb_work = $('.mob_wb_work')
		@ppl_pop_up_mob = $(".ppl_pop_up_mob")

	checkAdapt: ->
		if pf.wW > 1000
			return false
		else
			return true


# create class adapt
adapt = new Adapt()
window.adapt = adapt