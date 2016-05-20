$(window).load ->

  filter = $(".filter_form")  
  header = $(".header")
  wrapper = $("#wrapper")
  label = $(".my_resource_selection_toggle_cell label")
  flash_n = $(".flash_notice")
  flash_n_2 = $(".flash_notice_2")
  li_lang = $(".activeadmin-translate .ui-tabs-nav .ui-state-default")
  next_l = $(".next_language")
  fields = $(".activeadmin-translate fieldset.ui-widget-content")
  first = false
  second = false
  click = true
  time = 300
  languages = $(".has_many_credentional table th div")
  new_credo = $(".has_many_credentional .has_many_add")

  $(".show_filters").click ->
    $(this).toggleClass "active_filters"
    h = $(this).offset().top+$(this).outerHeight()+8
    filter.css("top": h)
    filter.toggle()  

  hide_flash_n_2 = ->
    flash_n_2.fadeTo "slow", 0, ->
      $(this).hide()
  click_flash_n_2 = ->
    flash_n_2.click ->
      hide_flash_n_2()
  click_flash_n_2()
   
  $("form").on "change", ".picture input[type='file']", (e) ->
    i = 0
    while i < e.originalEvent.srcElement.files.length
      file = e.originalEvent.srcElement.files[i]
      img = $(this).closest(".picture").find(".image_phone img")
      reader = new FileReader
      reader.onloadend = ->
        img.attr "src", reader.result
        img.parent().removeClass "no_picture"
      reader.readAsDataURL file
      i++
  
  $(".index_content table input[type='checkbox']").change ->
    height = 0
    if $("input:checkbox:checked").length != 0      
      height = label.parent().parent().innerHeight()+6
    label.css("top", height)
  
  show_flash = (flash, my_time)->
    my_f = ->
      flash.slideUp time
    flash.slideDown time, ->      
      setTimeout(my_f, my_time)      
  
  if flash_n.length > 0
    show_flash(flash_n, 1500)

  $(".has_many_fields .my_remove").change ->
    if $(this).is(':checked')
      $(this).parent().parent().parent().hide()  

  open_menu = ->     
    header.toggleClass("open_header")
    wrapper.toggleClass("open_wrapper")

  $(".header .click_title").click ->
    open_menu()

  li_lang.click ->
    click_language_function(languages.eq($(this).index()))
    if ($(this).index() + 1) < li_lang.length
      next_l.removeClass("next_hide")
    else
      next_l.addClass("next_hide")

  next_l.click ->
    active = li_lang.parent().find ".ui-tabs-active"
    index =  li_lang.index active 
    if index < li_lang.length
      li_lang.find("a").eq(index + 1).trigger "click"
      if li_lang.length == index + 2
        $(this).addClass("next_hide")
    lang_t = li_lang.offset().top-10
    if $(window).scrollTop() > lang_t
     $('html, body').animate { scrollTop: lang_t}, time
    # li_lang.eq(1).trigger "click"

  has_val = (inputs)->
    x = true
    inputs.each ->
      if !$(this).val() || $(this).val().length < 1
        x = false
    return x

  has_ckeditor = (editors)->
    x = true
    editors.each ->
      data = CKEDITOR.instances[$(this).find("textarea").attr("id")].getData()
      if !data || data.length < 1
        x = false
    return  x

  show_message = (href)->
    if (!href.hasClass "ui-tabs-all") && (!href.hasClass "all-element") && first && second
      text = "Вы заполнили эту языковую версию, пора переходить к следующей."
      if flash_n_2.length == 0
        html = '<div class="flashes"><div class="flash flash_notice_2" style="display: none; opacity: 0;">'+text+'</div></div>'
        wrapper.append html
        flash_n_2 = $(".flash_notice_2")
        click_flash_n_2()
      else 
        flash_n_2.text text
      flash_n_2.show()
      flash_n_2.fadeTo "slow", 1, ->
        setTimeout(hide_flash_n_2, 3000)

  add_method_ok = (fl)->
    id = fl.attr "id"
    href = $(".ui-tabs-nav li[aria-controls='"+id+"'] a")
    inputs = fl.find("li").not(".ckeditor").find("input[type='text'],textarea")
    editors = fl.find("li.ckeditor")
    if has_val(inputs) && has_ckeditor(editors) 
      show_message(href)
      href.addClass "ui-tabs-all"
    else
      href.removeClass "ui-tabs-all"
  
  after_load = ->
    fields.each ->
      add_method_ok $(this)
    first = true

  after_load()  

  $(".activeadmin-translate fieldset input[type='text'], .activeadmin-translate fieldset textarea").on 'textchange', ->
    add_method_ok $(this).closest "fieldset.ui-widget-content"

  for i of CKEDITOR.instances
    CKEDITOR.instances[i].on 'change', ->
      after_load()

  start_language = (locale)->
    str =  ".has_many_credentional .has_many_fields ol ."+locale
    $(".has_many_credentional .has_many_fields ol li .locals").closest(".has_many_fields ol li").hide()
    # $(".has_many_credentional .has_many_fields ol li.boolean").show()
    # $(".has_many_credentional .has_many_fields ol .has_many_remove").parent().show()
    $(str).parent().show()

  click_language_function = (element)->
    locale = element.data("locale")
    start_language locale
    parse_data_html locale
    $(".active_locale").removeClass "active_locale"
    element.addClass "active_locale"

  languages.click ->
    click_language_function $(this)
    li_lang.find("a").eq(languages.index(this)).trigger("click")
      
  parse_data_html = (locale)->
    html = $("<div />")
    html.html($.parseHTML(new_credo.data("html")))
    str =  "ol ."+locale
    html.find("ol li .locals").closest("ol li").hide()
    # html.find("ol li.boolean").show()
    # html.find("ol .has_many_remove").parent().show()
    html.find(str).parent().show()
    new_credo.data "html",html.html()

  element_select = ->
    active = languages.parent().find ".active_locale"
    index = languages.index active
    languages.eq(index).trigger "click"

  add_all_valu = (element)->
    class_element =  element.data "locale"
    inputs = $(".has_many_credentional .has_many_container li ."+class_element)
    if has_val(inputs)
      show_message(element)
      element.addClass "all-element"
    else
      element.removeClass "all-element"

  languages_complete = ->
    languages.each ->
      add_all_valu $(this)
    second = true
  languages_complete()

  $(".has_many_credentional .has_many_container").on "change paste keyup", "li input", ->
    locale =  $(this).data "locale"
    add_all_valu $(".has_many_credentional ."+locale)

  new_credo.click ->
    $(".all-element").removeClass "all-element"


  element_select()

  $(".has_nested > a").on "click", (event)->
    if $(".open_header").length > 0
      $(this).parent().toggleClass "opened_menu"
    else
      open_menu()