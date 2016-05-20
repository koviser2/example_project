$(window).on "load", ->
	# #####
	# page home
	# #####
	# first actives
	pf.header.addClass "active"
	# pf.pages.eq(pf.curPage).addClass "active"
	if pf.curPage == 0
		pf.cityAnimOut(pf.curPage)
	else
		pf.place_city()
		url = pf.nav_item.eq(pf.curPage-1).data("url")
		if url == window.location.pathname
			pf.showPage(pf.curPage)
		else
			index = window.location.pathname.replace(url+"/","")
			pf.pages.css {"opacity": 1}
			switch pf.curPage
				when 1
					element = pf.wb_menu_item.find("a[data-id='"+index+"']")
					element.parent().addClass "active"
					pf.click_web_element(element, 0)
				when 3
					casting.people_first()
					casting.showGal()
				when 4
					pf.locationsElement()
					pf.loc_nav.addClass("active")
					element = pf.loc_nav_item.find("a[data-id='"+index+"']")
					pf.click_loc_element element
		if pf.curPage == 1 && window.location.search.indexOf("video=") >= 0
			pf.workPopUpOpen()
			pf.hideWorkNavBtn()

	pf.main_work_block.eq(0).css "opacity", 1

	# setRandomAnimation to Work Pic
	pf.animWorkPicTo( $('.page_work') )

	# u can scroll down after 8s
	setTimeout (-> pf.pageFlag = true), 5000

	# mousewheel (change pages) (-1/1 = WheelDown/WheelTop)
	$(window).on "mousewheel", (event) ->
		event.preventDefault()
		if pf.pageFlag == true
			if event.deltaY == -1
				if pf.curPage+1 < pf.page.length
					pf.pageFlag = false
					if pf.curPage == 0
						pf.curPage+=1
						pf.cityAnimOut(pf.curPage)
					else
						pf.curPage+=1
						pf.showPage(pf.curPage)
			else
				if pf.curPage-1 >= 0
					pf.pageFlag = false
					if pf.curPage-1 == 0
						pf.cityAnimTo()
					pf.curPage-=1
					pf.showPage(pf.curPage)
			if pf.curPage == 0
				link.set_url pf.logo.data "url"
			else
				link.set_url pf.nav_item.eq(pf.curPage-1).data "url"


	menuClickFunc = (self) ->
		link.set_url self.data "url"
		thisIndex = self.index()+1
		if pf.curPage == 0
			pf.curPage = thisIndex
			pf.cityAnimOut(pf.curPage)
		else
			if thisIndex == pf.curPage
				return false
			else
				pf.curPage = thisIndex
				pf.showPage(pf.curPage)

	# menu click
	pf.nav_item.on 'click', (event) ->
		event.preventDefault()
		self = $(this)
		menuClickFunc(self)

	pf.nav_item_mob.on 'click', (event) ->
		event.preventDefault()
		self = $(this)
		menuClickFunc(self)

	# logo click
	pf.logo.on 'click', (event) ->
		event.preventDefault()
		link.set_url $(this).data "url"
		thisIndex = 0
		if thisIndex == pf.curPage
			return false
		else
			pf.curPage = thisIndex
			pf.showPage(pf.curPage)

	pf.work_block.on "click", ".btn", ->
		link.set_url $(this).data "url"
		pf.workPopUpOpen()
		pf.hideWorkNavBtn()

	# close pop up work
	pf.wb_pop_up_close.on "click", ".close", ->
		link.set_url window.location.pathname+link.del_video()
		pf.workPopUpClose()
		if pf.wb_cats.hasClass 'active'
			pf.showWorkNavBtn()

	# change category
	pf.wb_menu_item.find('a').on 'click', (event)->
		event.preventDefault()
		# get index category
		# pf.work_cat_eq = $(this).parent().index()
		link.set_url $(this).data "url"
		pf.work_page = 1
		pf.click_web_element(this)

	# back_work_btn click (hide categ_block and back to main work page)
	pf.back_work_btn.on "click", (event) ->
		event.preventDefault()
		link.set_url $(this).data "url"
		pf.hideWorkNavBtn()
		pf.hideWorkCat()

	# next_work_btn click (load next elements)
	pf.next_work_btn.on "click", (event) ->
		event.preventDefault()
		pf.work_page += 1
		link.work_page()
		pf.loadGetSkins()

	# prev_work_btn click (load prev elements)
	pf.prev_work_btn.on "click", (event) ->
		event.preventDefault()
		pf.work_page -= 1
		link.work_page()
		pf.loadGetSkins()