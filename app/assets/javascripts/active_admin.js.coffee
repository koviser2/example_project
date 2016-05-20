#= require jquery
#= require jquery_ujs
#= require jquery.textchange
#= require active_admin/base
#= require ckeditor/init
#= require ckeditor/config.js
#= require select2
#= require_tree ./admin

getLocation = (href) ->
  match = href.match(/^(https?\:)\/\/(([^:\/?#]*)(?:\:([0-9]+))?)(\/[^?#]*)(\?[^#]*|)(#.*|)$/)
  match and
    protocol: match[1]
    host: match[2]
    hostname: match[3]
    port: match[4]
    pathname: match[5]
    search: match[6]
    hash: match[7]
    
get_params_from_href = (href) ->
  paramstr = href.split('?')[1]
  paramsarr = paramstr.split('&')
  params = Array()
  i = 0
  while i < paramsarr.length
    tmparr = paramsarr[i].split('=')
    params[tmparr[0]] = tmparr[1]
    i++
  params

lest = (href)->
  href = href.split("/")
  href[href.length-1]

change_link = (link)->
  href = getLocation link
  reg_y = /youtube\.com|youtu\.be/gi
  reg_v = /vimeo\.com/gi
  reg = link.match reg_y
  if reg
    if link.match(/\?/gi)
      get = get_params_from_href(link)["v"]
    else
      get = lest href.pathname
    return "https://www.youtube.com/embed/"+get
  reg = link.match reg_v
  if reg
    get = lest href.pathname
    return 'https://player.vimeo.com/video/'+get
  return false

CKEDITOR.plugins.add 'video',
  icons: 'icons'
  init: (editor) ->
    editor.addCommand 'insertVideo', new CKEDITOR.dialogCommand( 'videoDialog' )       
    editor.ui.addButton 'Video',
      label: 'Insert Video'
      command: 'insertVideo'
      toolbar: 'insert'

CKEDITOR.dialog.add 'videoDialog', (editor) ->
  {
    title: 'Abbreviation Properties'
    minWidth: 400
    minHeight: 200
    contents: [
      {
        id: 'tab-basic'
        label: 'Url Links'
        elements: [
          {
            type: 'text'
            id: 'link'
            label: 'Link'
            validate: CKEDITOR.dialog.validate.notEmpty('Abbreviation field cannot be empty.')
          }
          {
            type: 'text'
            id: 'width'
            label: 'width'
          }
          {
            type: 'text'
            id: 'height'
            label: 'height'
          }
        ]
      }      
    ]
    onOk: ->
      dialog = this
      iframe = editor.document.createElement 'iframe'
      link = dialog.getValueOf('tab-basic', 'link')
      href = change_link(link)
      if href == false
        href = link
      iframe.setAttribute 'src',href
      iframe.setAttribute 'width', dialog.getValueOf('tab-basic', 'width')
      iframe.setAttribute 'height', dialog.getValueOf('tab-basic', 'height')
      iframe.setAttribute 'frameborder', 0
      iframe.setAttribute 'allowfullscreen'
      iframe.setText link+href
      editor.insertElement iframe
      return
  }

CKEDITOR.config.extraPlugins = "video"

CKEDITOR.config.toolbar = [ 
  {
    name: 'toolbar'
    items: [
      'Undo'
      'Redo'
      'Bold'
      'Italic'
      'Link'
      'Image'
      'Iframe'
      'JustifyLeft'
      'JustifyCenter'
      'JustifyRight'
      'NumberedList'
      'BulletedList'
      'Video'
    ]
  }
]
