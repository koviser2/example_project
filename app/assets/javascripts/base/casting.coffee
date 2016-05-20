$(window).on "load", ->
  casting.text.on 'click', ->
    link.set_url $(this).data "url"
    casting.fall() # callback -> casting.showGal
    casting.type = $(this).data("type")
    load.get_casting
      type: $(this).data("type")    

  casting.backBtn.on 'click', (event) ->
    event.preventDefault()
    link.set_url $(this).data "url"
    casting.fallClear()
    casting.hideGal()
    casting.page = 0
    TweenMax.set(casting.botText, {y: "0%"})

  # next_work_btn click (load next elements)
  casting.btn_next.on "click", (event) ->
    event.preventDefault()
    casting.page += 1
    casting.load_element()

  # prev_work_btn click (load prev elements)
  casting.btn_prev.on "click", (event) ->
    event.preventDefault()
    casting.page -= 1
    casting.load_element()
