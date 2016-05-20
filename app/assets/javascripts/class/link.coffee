# Pronto Film

'use strict'
class Link
  constructor: ()->
    @state = History.getState()
    @locals = $(".add_info .langs a")

  set_url: (url)->
    History.pushState(null, null, url)
    link_ar = url.substr(1).split("/")
    for element in @locals
      link = @_change_url(link_ar, $(element).data("loc"))
      $(element).attr("href", link)

  work_page: ->
    url = $(".wb_menu_item.active a").data("url")
    url += "?page="+pf.work_page
    @set_url url

  location_page: ->
    url = pf.loc_nav_item.find(".active").data("url")
    url += "?page="+pf.locale_page
    @set_url url

  casting_page: ->
    url = $(".cast_gal .titles .active").data "url"
    url += "?page="+casting.page
    @set_url url

  del_video: (param = "video=")->
    query = window.location.search.substr(1)
    result = ""
    query.split('&').forEach (part) ->
      if part.indexOf(param) < 0
        result += part+"&"
    if result.length > 0
      result = "?"+result.substring(0, result.length - 1)
    result

  _change_url: (array, locale)->
    array[0] = locale
    str = ""
    for element in array
      str += "/"+element
    str

# create class Link
link = new Link()
window.link = link