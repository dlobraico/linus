# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery(document).ready ->
  #tracker = new ice.InlineChangeEditor(
    #element: document.getElementById("submission")
    #handleEvents: true
    #currentUser:
      #id: 1
      #name: "DJ LoBraico"

      #plugins: [ 
        #"IceAddTitlePlugin", 
        #"IceEmdashPlugin",
        #name: "IceCopyPastePlugin"
        #settings:
          #preserve: "p,a[href],span[id,class]em,strong"
      #]
  #).startTracking()

  if (jQuery("#submission_body").val() != "") 
    jQuery("#submission_body_editable").html(jQuery("#submission_body").val())

  jQuery(".editable").hallo
    plugins:
      halloformat: {}
      hallojustify: {}
      #hallolists: {}
      #halloheadings: {}
      #halloindicator: {}
      #halloblock: {}
      #hallolink: {}
      #halloreundo: {}
      #halloimage: {}

    editable: true
    toolbar: 'halloToolbarFixed'

  jQuery("#submission_body_editable").blur ->
    jQuery("#submission_body").val(jQuery("#submission_body_editable").html())
  #jQuery("#submission_save").button.click ->
    #jQuery("#submission_body").html(jQuery("#submission_body_editable").html())
