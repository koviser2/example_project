$ ->
  fields_toggler = (p, v) ->  
    console.log "v: " + v
    if v == 'product'
      p.slideUp('slow')

  $.each $('.type_selector'), (i, value) ->
    fields_toggler($('fieldset.tag_list'), $(value).val())

  init_type_selector = () ->
    $('.type_selector').change () ->
      fields_toggler($('fieldset.tag_list'), $(@).val())
  init_type_selector()