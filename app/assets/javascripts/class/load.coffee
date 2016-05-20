# Pronto Film

'use strict'
class Load
  constructor: ()->
    @lang = $('html').attr('lang')

  #ajax view
  _ajax_send: (hash)->
    $.ajax
      type: 'POST'
      url: "/#{@lang}/#{hash.url}.json"
      data: hash.data
      beforeSend: ->
        if hash.beforeSend
          hash.beforeSend()
      complete: (data)->
        if hash.callback
          hash.callback()
      dataType: 'script'

  #get_skins
  get_skins: (hash)->
    @_ajax_send {
      url: "get_skins"
      data: {
        page: pf.work_page
        id: hash.id
      }
      beforeSend: hash.beforeSend
      callback: hash.callback
    }

  #get_casting
  get_casting: (hash)->
    @_ajax_send {
      url: "get_casting"
      data: {
        page: casting.page
        type: hash.type
      }
      beforeSend: hash.beforeSend
      callback: hash.callback
    }

  #get_work
  get_skin: (hash)->
    @_ajax_send {
      url: "get_skin"
      data: {
        id: hash.id
      }
      beforeSend: hash.beforeSend
      callback: hash.callback
    }

  #get_locales
  get_locales: (id, callback)->
    @_ajax_send {
      url: "get_locations"
      data: {
        page: pf.locale_page
        id: id
      }
      callback: callback
    }

  #get_about_info
  get_about_info: (hash)->
    @_ajax_send {
      url: "get_about_info"
      data: {
        id: hash.id
      }
      callback: hash.callback
      beforeSend: hash.beforeSend
    }

# create class load
load = new Load()
window.load = load