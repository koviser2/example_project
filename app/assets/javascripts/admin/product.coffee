$(window).load ->

  client = $("fieldset .div_li")
  sl_text = $("#product_slider_text_input")
  sc_check = $("#product_slider")
  time = 300
  
  sc_check.change ->
    if $(this).prop 'checked'
      sl_text.slideDown time
    else
      sl_text.slideUp time

  $("#product_tag_id").change ->
    index = $(this)[0].selectedIndex
    if index == 1
      client.removeClass "hide_li"
    else
      client.addClass "hide_li"
