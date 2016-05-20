# Clients
class Clients
    constructor: () ->
        @active = false
        @page = $('.page_clients')
        @logos_wrapper = @page.find('.logos').find('.wrapper')
        @center = $(window).width() / 2
        @max_w = @logos_wrapper.width()
        @pw = @page.width()

    move: (x) ->
        TweenMax.to(clients.logos_wrapper, .3, {x: x})

    anim: (bool) -> 
        if bool
            setTimeout ( ->
                clients.page.addClass 'go'
            ), 500
        else
            clients.page.removeClass 'go'
            
   
# create class load
clients = new Clients()
window.clients = clients